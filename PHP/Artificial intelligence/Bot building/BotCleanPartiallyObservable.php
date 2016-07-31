<?php
// https://www.hackerrank.com/challenges/botclean

class Node {
	var $children;
	var $distance;
	var $level;
	var $r;
	var $c;
	var $board;
	var $root;

	function __construct($r, $c, $board)
	{
		$this->r = $r;
		$this->c = $c;
		$this->board = $board;
		$this->children = [];
		$this->root = false;
		$this->distance = 0;
		$this->level = 0;

		$this->board[intval($r)][intval($c)] = '-';
	}

	function getDirties()
	{
		$d = [];
		for ($i = 0; $i < count($this->board); $i++) {
			for ($j = 0; $j < strlen($this->board[$i]); $j++) {
				if ($this->board[$i][$j] == 'd') {
					$d[] = [
						'r' => $i,
						'c' => $j
					];
				}
			}
		}

		return $d;
	}
}

function canMove(&$to, &$nextTo, $posr, $posc, $board)
{
	$n = count($board);

	switch ($to) {
		case 'RIGHT':
			if ($posc < $n - 1 && $posc >= 0 && $posr >= 0 && $posr < $n) {
				return [$posr, $posc + 1];
			} else {
				$to = $nextTo;
				$nextTo = 'LEFT';
				return false;
			}

		case 'LEFT':
			if ($posc > 0 && $posc < $n && $posr >= 0 && $posr < $n) {
				return [$posr, $posc - 1];
			} else {
				$to = $nextTo;
				$nextTo = 'RIGHT';
				return false;
			}

		case 'DOWN':
			if ($posr < $n - 1 && $posr >= 0 && $posc >= 0 && $posc < $n) {
				$to = $nextTo;
				$nextTo = 'DOWN';
				return [$posr + 1, $posc];
			} else {
				$to = 'UP';
				$nextTo = $nextTo;
				return false;
			}

		case 'UP':
			if ($posr < $n && $posr > 0 && $posc >= 0 && $posc < $n) {
				$to = $nextTo;
				$nextTo = 'UP';
				return [$posr - 1, $posc];
			} else {
				$to = 'DOWN';
				$nextTo = $nextTo;
				return false;
			}

		default:
			file_put_contents('php://stderr', 'SWITCH DEFAULT');
			break;
	}

	return false;
}

function saveBoard($bh, $board)
{
	$save = implode("\n", $board);
	file_put_contents($bh, $save);
}

function printNext($r, $c, $posr, $posc)
{
	if ($r < $posr) {
		echo "UP\n";
		return;
	}

	if ($c > $posc) {
		echo "RIGHT\n";
		return;
	}

	if ($r > $posr) {
		echo "DOWN\n";
		return;
	}

	if ($c < $posc) {
		echo "LEFT\n";
		return;
	}

	file_put_contents('php://stderr', 'PRINT NEXT NONE');
}

function next_move(&$posr, &$posc, &$board)
{
	$bh = 'board.txt';
	if (file_exists($bh)) {
		$savedBoard = file_get_contents($bh);
		$savedBoard = explode("\n", $savedBoard);
		for ($i = 0; $i < count($board); $i++) {
			for ($j = 0; $j < strlen($board[$i]); $j++) {
				if ($board[intval($i)][intval($j)] == 'o') {
					$board[intval($i)][intval($j)] = $savedBoard[intval($i)][intval($j)];
				}
			}
		}
	}

	saveBoard($bh, $board);

	if ($board[intval($posr)][intval($posc)] == 'd') {
		echo "CLEAN\n";
		return;
	}

	$root = new Node($posr, $posc, $board);
	$root->root = 7;
	$q = [$root];
	while (!empty($q)) {
		$current = array_shift($q);
		# Avoid timeout
		if ($current->level > 4) {
			continue;
		}
		$dirties = $current->getDirties();
		foreach ($dirties as $dirty) {
			$child = new Node($dirty['r'], $dirty['c'], $current->board);
			$child->distance = $current->distance + abs($dirty['r'] - $current->r) + abs($dirty['c'] - $current->c);
			$child->level = $current->level + 1;
			if ($current->root === false) {
				$child->root = [
					'r' => $current->r,
					'c' => $current->c
				];
			} else if ($current->root != 7) {
				$child->root = $current->root;
			}
			$current->children[] = $child;
			$q[] = $child;
		}
	}

	$q = [$root];
	$minV = 50;
	$minP = [];
	while (!empty($q)) {
		$current = array_shift($q);
		if (count($current->children) > 0) {
			foreach ($current->children as $child) {
				$q[] = $child;
			}
		} else {
			if ($current->distance < $minV) {
				$minV = $current->distance;
				if (empty($current->root)) {
					$minP = [
						'r' => $current->r,
						'c' => $current->c
					];
				} else {
					$minP = $current->root;
				}
			}
		}
	}

	if (empty($minP['r']) && empty($minP['c'])) {
		$wh = 'move.txt';
		$next = null;
		while (empty($next)) {
			if (file_exists($wh)) {
				$f = file_get_contents($wh);
				$f = explode('-', $f);
			}
			if (!empty($f[0]) && !empty($f[1])) {
				$to = $f[0];
				$nextTo = $f[1];
			} else {
				$to = 'RIGHT';
				$nextTo = 'DOWN';
			}
			$next = canMove($to, $nextTo, $posr, $posc, $board);
			file_put_contents($wh, "{$to}-{$nextTo}");
		}
		printNext($next[0], $next[1], $posr, $posc);
		return;
	}

	printNext($minP['r'], $minP['c'], $posr, $posc);
}

$fp = fopen("php://stdin", "r");

$temp = fgets($fp); //moves made by the second player
$position = explode(' ',$temp);

$board = array();

for ($i = 0; $i < 5; $i++) {
	fscanf($fp, "%s", $board[$i]);
}

next_move($position[0], $position[1], $board);
?>

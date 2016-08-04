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

function next_move(&$posr, &$posc, &$board)
{
	if ($board[intval($posr)][intval($posc)] == 'd') {
		echo "CLEAN\n";
	} else {
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

		if ($minP['r'] < $posr) {
			echo "UP\n";
		} else if ($minP['c'] > $posc) {
			echo "RIGHT\n";
		} else if ($minP['r'] > $posr) {
			echo "DOWN\n";
		} else if ($minP['c'] < $posc) {
			echo "LEFT\n";
		}
	}
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

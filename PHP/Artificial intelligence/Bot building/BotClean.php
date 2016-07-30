<?php
// https://www.hackerrank.com/challenges/botclean

class Node {
	var $children;
	var $distance;
	var $level;
	var $r;
	var $c;
	var $board;

	function __construct($r, $c, $board)
	{
		$this->r = $r;
		$this->c = $c;
		$this->board = $board;
		$this->children = [];
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
	$root = new Node($posr, $posc, $board);
	$q = [$root];
	while (!empty($q)) {
		$current = array_shift($q);
		$dirties = $current->getDirties();
		foreach ($dirties as $dirty) {
			$child = new Node($dirty['r'], $dirty['c'], $current->board);
			$child->distance = $current->distance + abs($dirty['r'] - $current->r) + abs($dirty['c'] - $current->c);
			$child->level = $current->level + 1;
			$current->children[] = $child;
			$q[] = $child;
		}
	}

	$finals = [];
	$q = [$root];
	while (!empty($q)) {
		$current = array_shift($q);
		if (count($current->children) == 0) {
			$finals[] = $current;
		} else {
			$q[] = $current->children;
		}
	}

	print_r($finals);
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

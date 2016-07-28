<?php
// https://www.hackerrank.com/challenges/botcleanv2

function findNextDirty($posr, $posc, &$board)
{
	if (boardIsClean($board)) {
		return null;
	}

	rememberDirties($board);

	$n = count($board);

	if ($posc < $n - 1 && $posc >= 0 && $posr >= 0 && $posr < $n && $board[$posr][$posc + 1] == 'd') {
		return [$posr, $posc + 1];
	} else if ($posr < $n - 1 && $posr >= 0 && $posc < $n - 1 && $posc >= 0 && $board[$posr + 1][$posc + 1] == 'd') {
		return [$posr + 1, $posc + 1];
	} else if ($posr < $n - 1 && $posr >= 0 && $posc >= 0 && $posc < $n && $board[$posr + 1][$posc] == 'd') {
		return [$posr + 1, $posc];
	} else if ($posr < $n - 1 && $posr >= 0 && $posc > 0 && $posc < $n && $board[$posr + 1][$posc - 1] == 'd') {
		return [$posr + 1, $posc - 1];
	} else if ($posc > 0 && $posc < $n && $posr >= 0 && $posr < $n && $board[$posr][$posc - 1] == 'd') {
		return [$posr, $posc - 1];
	} else if ($posr > 0 && $posr < $n && $posc > 0 && $posc < $n && $board[$posr - 1][$posc - 1] == 'd') {
		return [$posr - 1, $posc - 1];
	} else if ($posr > 0 && $posr < $n && $posc >= 0 && $posc < $n && $board[$posr - 1][$posc] == 'd') {
		return [$posr - 1, $posc];
	} else if ($posr > 0 && $posr < $n && $posc < $n - 1 && $posc >= 0 && $board[$posr - 1][$posc + 1] == 'd') {
		return [$posr - 1, $posc + 1];
	}

	return null;
}

function rememberDirties(&$board)
{
	if ($board[$posr][$posc] == 'd') {
		$board[$posr][$posc] = $board[$posr][$posc];
	}
	
	if ($board[$posr][$posc + 1]) {
		$board[$posr][$posc + 1] = $board[$posr][$posc + 1];
	}
	
	if ($board[$posr + 1][$posc + 1]) {
		$board[$posr + 1][$posc + 1] = $board[$posr + 1][$posc + 1];
	}
	
	if ($board[$posr + 1][$posc]) {
		$board[$posr + 1][$posc] = $board[$posr + 1][$posc];
	}
	
	if ($board[$posr + 1][$posc - 1]) {
		$board[$posr + 1][$posc - 1] = $board[$posr + 1][$posc - 1];
	}
	
	if ($board[$posr][$posc - 1]) {
		$board[$posr][$posc - 1] = $board[$posr][$posc - 1];
	}
	
	if ($board[$posr - 1][$posc - 1]) {
		$board[$posr - 1][$posc - 1] = $board[$posr - 1][$posc - 1];
	}
	
	if ($board[$posr - 1][$posc]) {
		$board[$posr - 1][$posc] = $board[$posr - 1][$posc];
	}
	
	if ($board[$posr - 1][$posc + 1]) {
		$board[$posr - 1][$posc + 1] = $board[$posr - 1][$posc + 1];
	}
}

function canMoveTo($posr, $posc, $board)
{
	$n = count($board);

	if ($posr < $n - 1 && $posr >= 0 && $posc < $n - 1 && $posc >= 0) {
		return [$posr + 1, $posc + 1];
	} else if ($posr < $n - 1 && $posr >= 0 && $posc >= 0 && $posc < $n) {
		return [$posr + 1, $posc];
	} else if ($posr < $n - 1 && $posr >= 0 && $posc > 0 && $posc < $n) {
		return [$posr + 1, $posc - 1];
	} else if ($posc > 0 && $posc < $n && $posr >= 0 && $posr < $n) {
		return [$posr, $posc - 1];
	} else if ($posr > 0 && $posr < $n && $posc > 0 && $posc < $n) {
		return [$posr - 1, $posc - 1];
	} else if ($posr > 0 && $posr < $n && $posc >= 0 && $posc < $n) {
		return [$posr - 1, $posc];
	} else if ($posr > 0 && $posr < $n && $posc < $n - 1 && $posc >= 0) {
		return [$posr - 1, $posc + 1];
	} else if ($posc < $n - 1 && $posc >= 0 && $posr >= 0 && $posr < $n) {
		return [$posr, $posc + 1];
	}

	return null;
}

function boardIsClean($board) {
	for ($i = 0; $i < count($board); $i++) {
		for ($j = 0; $j < strlen($board[$i]); $j++) {
			if ($board[$i][$j] == 'd') {
				return false;
			}
		}
	}

	return true;
}

function next_move(&$posr, &$posc, &$board)
{
	$posr = intval($posr);
	$posc = intval($posc);
	$n = count($board);
	if ($board[$posr][$posc] == 'd') {
		print("CLEAN\n");
		$board[$posr][$posc] = '-';
	} else {
		$next = findNextDirty($posr, $posc, $board);

		$r = $posr;
		$c = $posc;
		$offset = 1;
		$direction = 0;

		while (empty($next)) {
			if ($offset > 1) {
				$next = canMoveTo($posr, $posc, $board);
				break;
			}

			if ($c < $n - 1 && $c >= 0 && $r >= 0 && $r < $n) {
				$next = findNextDirty($r, $c + 1, $board);
				if (!empty($next)) {
					break;
				}
			}

			if ($r < $n - 1 && $r >= 0 && $c < $n - 1 && $c >= 0) {
				$next = findNextDirty($r + 1, $c + 1, $board);
				if (!empty($next)) {
					break;
				}	
			}

			if ($r < $n - 1 && $r >= 0 && $c >= 0 && $c < $n) {
				$next = findNextDirty($r + 1, $c, $board);
				if (!empty($next)) {
					break;
				}	
			}

			if ($r < $n - 1 && $r >= 0 && $c > 0 && $c < $n) {
				$next = findNextDirty($r + 1, $c - 1, $board);
				if (!empty($next)) {
					break;
				}	
			}

			if ($c > 0 && $c < $n && $r >= 0 && $r < $n) {
				$next = findNextDirty($r, $c - 1, $board);
				if (!empty($next)) {
					break;
				}
			}
			
			if ($r > 0 && $r < $n && $c > 0 && $c < $n) {
				$next = findNextDirty($r - 1, $c - 1, $board);
				if (!empty($next)) {
					break;
				}
			}
			
			if ($r > 0 && $r < $n && $c >= 0 && $c < $n) {
				$next = findNextDirty($r - 1, $c, $board);
				if (!empty($next)) {
					break;
				}
			}
			
			if ($r > 0 && $r < $n && $c < $n - 1 && $c >= 0) {
				$next = findNextDirty($r - 1, $c + 1, $board);
				if (!empty($next)) {
					break;
				}
			}

			switch ($direction % 8) {
				case 0 :
					$r = $posr + $offset;
					$c = $posc;
					break;
				case 1 :
					$r = $posr;
					$c = $posc + $offset;
					break;
				case 2 :
					$r = $posr - $offset;
					$c = $posc;
					break;
				case 3 :
					$r = $posr;
					$c = $posc - $offset;
					break;
				case 4 :
					$r = $posr + $offset;
					$c = $posc + $offset;
					break;
				case 5 :
					$r = $posr + $offset;
					$c = $posc - $offset;
					break;
				case 6 :
					$r = $posr - $offset;
					$c = $posc - $offset;
					break;
				case 7 :
					$r = $posr - $offset;
					$c = $posc + $offset;
					$offset++;
					break;
			}

			$direction++;
		}

		if ($next[1] > $posc) {
			print("RIGHT\n");
		} else if ($next[0] > $posr) {
			print("DOWN\n");
		} else if ($next[1] < $posc) {
			print("LEFT\n");
		} else if ($next[0] < $posr) {
			print("UP\n");
		}
	}
	return 0;
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

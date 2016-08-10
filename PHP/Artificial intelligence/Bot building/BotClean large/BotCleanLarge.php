<?php
// https://www.hackerrank.com/challenges/botcleanlarge

function findNextDirty($posr, $posc, $dimh, $dimw, $board)
{
	if (boardIsClean($board)) {
		return null;
	}

	if ($posr < $dimh - 1 && $posr >= 0 && $posc >= 0 && $posc < $dimw && $board[$posr + 1][$posc] == 'd') {
		return [$posr + 1, $posc];
	} else if ($posr > 0 && $posr < $dimh && $posc >= 0 && $posc < $dimw && $board[$posr - 1][$posc] == 'd') {
		return [$posr - 1, $posc];
	} else if ($posc < $dimw - 1 && $posc >= 0 && $posr >= 0 && $posr < $dimh && $board[$posr][$posc + 1] == 'd') {
		return [$posr, $posc + 1];
	} else if ($posc > 0 && $posc < $dimw && $posr >= 0 && $posr < $dimh && $board[$posr][$posc - 1] == 'd') {
		return [$posr, $posc - 1];
	} else if ($posr > 0 && $posr < $dimh && $posc > 0 && $posc < $dimw && $board[$posr - 1][$posc - 1] == 'd') {
		return [$posr - 1, $posc - 1];
	} else if ($posr > 0 && $posr < $dimh && $posc < $dimw - 1 && $posc >= 0 && $board[$posr - 1][$posc + 1] == 'd') {
		return [$posr - 1, $posc + 1];
	} else if ($posr < $dimh - 1 && $posr >= 0 && $posc > 0 && $posc < $dimw && $board[$posr + 1][$posc - 1] == 'd') {
		return [$posr + 1, $posc - 1];
	} else if ($posr < $dimh - 1 && $posr >= 0 && $posc < $dimw - 1 && $posc >= 0 && $board[$posr + 1][$posc + 1] == 'd') {
		return [$posr + 1, $posc + 1];
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

function next_move(&$posr, &$posc, &$dimh, &$dimw, &$board)
{
	$posr = intval($posr);
	$posc = intval($posc);
	if ($board[$posr][$posc] == 'd') {
		print("CLEAN\n");
	} else {
		$next = findNextDirty($posr, $posc, $dimh, $dimw, $board);

		$r = $posr;
		$c = $posc;
		$offset = 1;
		$direction = 0;

		while (empty($next)) {
			if ($r < $dimh - 1 && $r >= 0 && $c >= 0 && $c < $dimw) {
				$next = findNextDirty($r + 1, $c, $dimh, $dimw, $board);
				if (!empty($next)) {
					break;
				}	
			}
			
			if ($r > 0 && $r < $dimh && $c >= 0 && $c < $dimw) {
				$next = findNextDirty($r - 1, $c, $dimh, $dimw, $board);
				if (!empty($next)) {
					break;
				}
			}

			if ($c < $dimw - 1 && $c >= 0 && $r >= 0 && $r < $dimh) {
				$next = findNextDirty($r, $c + 1, $dimh, $dimw, $board);
				if (!empty($next)) {
					break;
				}
			}

			if ($c > 0 && $c < $dimw && $r >= 0 && $r < $dimh) {
				$next = findNextDirty($r, $c - 1, $dimh, $dimw, $board);
				if (!empty($next)) {
					break;
				}
			}

			$direction++;
			switch ($direction % 8) {
				case 0 :
					$r = $posr + $offset;
					$c = $posc;
					$offset++;
					break;
				case 1 :
					$r = $posr - $offset;
					$c = $posc;
					break;
				case 2 :
					$r = $posr;
					$c = $posc + $offset;
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
					$c = $posc + $offset;
					break;
				case 7 :
					$r = $posr - $offset;
					$c = $posc - $offset;
					break;
			}
		}

		if ($next[0] > $posr) {
			print("DOWN\n");
		} else if ($next[0] < $posr) {
			print("UP\n");
		} else if ($next[1] > $posc) {
			print("RIGHT\n");
		} else if ($next[1] < $posc) {
			print("LEFT\n");
		}
	}
	return 0;
}

$fp = fopen("php://stdin", "r");

$temp = fgets($fp);
$position = explode(' ',$temp);
$temp = fgets($fp);
$dimension = explode(' ',$temp);

$board = array();

for ($i = 0; $i < $dimension[0]; $i++) {
    fscanf($fp, "%s", $board[$i]);
}

next_move($position[0], $position[1], $dimension[0], $dimension[1], $board);
?>

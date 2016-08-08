<?php
// https://www.hackerrank.com/challenges/saveprincess2

function nextMove($n, $r, $c, $grid)
{
	//your logic here
	foreach ($grid as $i => $row) {
		if (($p = strpos($row, 'p')) !== false) {
			if ($i < $r) {
				print("UP\n");
			} else if ($i > $r) {
				print("DOWN\n");
			} else if ($p > $c) {
				print("RIGHT\n");
			} else if ($p < $c) {
				print("LEFT\n");
			}

			break;
		}
	}
}

$fp = fopen("php://stdin", "r");

fscanf($fp, "%d", $n);
$pos = fgets($fp);
$pos = explode(" ", $pos);
$grid = array();
for ($i = 0; $i < $n; $i++) {
	fscanf($fp, "%s", $grid[$i]);
}

nextMove($n, $pos[0], $pos[1], $grid);
?>

<?php
// https://www.hackerrank.com/challenges/saveprincess

function displayPathtoPrincess($n, $grid)
{
	$m = ($n - 1) / 2;
	if ($grid[0][0] == 'p') {
		$pX = 0;
		$pY = 0;
		for ($i = $m; $i > $pY; $i--) {
			print("UP\n");
		}
		for ($i = $m; $i > $pX; $i--) {
			print("LEFT\n");
		}
	} else if ($grid[0][$n - 1] == 'p') {
		$pX = $n - 1;
		$pY = 0;
		for ($i = $m; $i > $pY; $i--) {
			print("UP\n");
		}
		for ($i = $m; $i < $pX; $i++) {
			print("RIGHT\n");
		}
	} else if ($grid[$n - 1][0] == 'p') {
		$pX = 0;
		$pY = $n - 1;
		for ($i = $m; $i < $pY; $i++) {
			print("DOWN\n");
		}
		for ($i = $m; $i > $pX; $i--) {
			print("LEFT\n");
		}
	} else if ($grid[$n - 1][$n - 1] == 'p') {
		$pX = $n - 1;
		$pY = $n - 1;
		for ($i = $m; $i < $pY; $i++) {
			print("DOWN\n");
		}
		for ($i = $m; $i < $pX; $i++) {
			print("RIGHT\n");
		}
	}
}

$fp = fopen("php://stdin", "r");

fscanf($fp, "%s", $m);

$grid = array();

for ($i = 0; $i < $m; $i++) {
    fscanf($fp, "%s", $grid[$i]);
}

displayPathtoPrincess($m, $grid);
?>

<?php
# https://www.hackerrank.com/challenges/battery

$fp = fopen("php://stdin", "r");
# Enter your code here. Read input from STDIN. Print output to STDOUT

while (!feof($fp)) {
	$value = fgets($fp);
	if (empty($value)) {
		continue;
	}
	
	# Fill up your code here
	$output = min($value * 2, 8);
	$output = number_format($output, 2, '.', '');
	print("$output\n");
}
?>

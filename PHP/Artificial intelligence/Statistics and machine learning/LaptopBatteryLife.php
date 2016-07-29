<?php
# https://www.hackerrank.com/challenges/battery

# Read training data
$training = file_get_contents('trainingdata.txt');
$training = explode("\n", $training);
foreach ($training as $key => $value) {
	$training[$key] = explode(',', $value);
}

for ($i = 0; $i < count($training) - 1; $i++) {
	for ($j = $i + 1; $j < count($training); $j++) {
		if ($training[$i][0] > $training[$j][0]) {
			$x = $training[$i];
			$training[$i] = $training[$j];
			$training[$j] = $x;
		}
	}
}

$fp = fopen("php://stdin", "r");
# Enter your code here. Read input from STDIN. Print output to STDOUT

while (!feof($fp)) {
	
	$value = fgets($fp);
	if (empty($value)) {
		continue;
	}
	
	# Fill up your code here
	for ($i = 0; $i < count($training); $i++) {
		if ($training[$i][0] > $value) {
			break;
		}
	}
	echo ":::$i\n";

	$output = array_slice($training, max(0, $i - 20), 40);
	$charge = 0;
	$life = 0;
	for ($i = 0; $i < count($output); $i++) {
		$charge += $output[$i][0];
		$life += $output[$i][1];
	}
	$charge /= count($output);
	$life /= count($output);
	$output = $value / $charge * $life;
	$output = number_format($output, 2, '.', '');
	print("$output\n");
}
?>

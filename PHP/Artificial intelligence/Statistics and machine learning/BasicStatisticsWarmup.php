<?php
# https://www.hackerrank.com/challenges/stat-warmup

$fp = fopen("php://stdin", "r");
$n = fgets($fp);
$arr = fgets($fp);
$arr = explode(' ', $arr);
$arrSorted = $arr;
sort($arrSorted);

$s = 0;
$mode = [];
foreach ($arr as $i) {
	$s += $i;
	if (empty($mode[$i])) {
		$mode[$i] = 0;
	}
	$mode[$i]++;
}

# Mean (m)
$m = $s / $n;

# Median
if ($n % 2 == 0) {
	$median = intval($n / 2);
	$median = ($arrSorted[$median - 1] + $arrSorted[$median]) / 2;	
} else {
	$median = $arrSorted[intval($n / 2)];
}

# Mode
asort($mode);
$_max = max($mode);
$_min = max($arr); // We start with the biggest number
foreach ($mode as $key => $value) {
	if ($value == $_max && $_min > $key) {
		$_min = $key;
	}
}
$mode = $_min;
unset($_max);
unset($_min);

# Standard deviation = (((x1-m)2+(x2-m)2+(x3-m)2+(x4-m)2+...(xN-m)2))/N)0.5
$sd = 0;
foreach ($arr as $i) {
	$sd += pow($i - $m, 2);
}
$sd = pow($sd / $n, 0.5);

# Lower and upper boundary of confidence interval
$lb = $m - 1.96 * ($sd / sqrt((float)$n));
$ub = $m + 1.96 * ($sd / sqrt((float)$n));

$m = number_format($m, 1, '.', '');
$median = number_format($median, 1, '.', '');
$sd = number_format($sd, 1, '.', '');
$lb = number_format($lb, 1, '.', '');
$ub = number_format($ub, 1, '.', '');
print("$m\n");
print("$median\n");
print("$mode\n");
print("$sd\n");
print("$lb $ub\n");
?>

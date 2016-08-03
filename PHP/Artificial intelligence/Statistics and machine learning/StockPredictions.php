<?php
# https://www.hackerrank.com/challenges/stockprediction

$fp = fopen("php://stdin", "r");
/* Enter your code here. Read input from STDIN. Print output to STDOUT */

$temp = fgets($fp);
$temp = explode(' ', $temp);
$m = $temp[0]; # Amount of money you could spend that day
$k = $temp[1]; # Number of different stocks available for buying or selling
$d = $temp[2]; # Number of remaining days for trading stocks
$s = []; # Stocks

for ($i = 0; $i < $k; $i++) {
    $temp = fgets($fp);
    $temp = explode(' ', $temp);
    $name = $temp[0]; # The name of the stock (a string).
    $owned = $temp[1]; # The number of shares you own of that stock.
    $prices = array_slice($temp, 2); # 5 space separated numbers representing the stock's price for the last 5 days. These are ordered from oldest to newest, so the last number is the current stock price
    $avg = 0;
    for ($j = 1; $j < count($prices); $j++) {
        $avg += $prices[$j] - $prices[$j - 1];
    }
    $avg /= count($prices);
    $s[] = [
        'name' => $name,
        'owned' => $owned,
        'prices' => $prices,
        'average' => $avg
    ];
}

$n = 0; # Number of performed transactions

# Sell
$max['owned'] = 0;
$max['buyed'] = 0;
$max['itemo'] = [];
$max['itemb'] = [];
foreach ($s as $item) {
    if ($item['owned'] <= 0) {
        continue;
    }

    $todaysPrice = $item['prices'][count($item['prices']) - 1]; 

    $maxCurrent = max($todaysPrice * $item['owned'], ($todaysPrice + $item['average']) * $item['owned']);
    $max['owned'] = max($max['owned'], $maxCurrent);
    if ($max['owned'] == $maxCurrent) {
        $max['itemo'] = $item;
    }
}

# Buy
foreach ($s as $item) {
    $todaysPrice = $item['prices'][count($item['prices']) - 1];
    $i = 0;
    while ($todaysPrice * $i <= $m) {
        $i++;
    }

    $maxCurrent = max($todaysPrice * ($i - 1), ($todaysPrice + $item['average']) * ($i - 1));
    $max['buyed'] = max($max['buyed'], $maxCurrent);
    if ($max['buyed'] == $maxCurrent) {
        $max['itemb'] = $item;
    }
}
print_r($max);

?>

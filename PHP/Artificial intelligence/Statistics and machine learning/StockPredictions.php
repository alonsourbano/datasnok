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

# Owned
$max['owned'] = 0;
$max['buyed'] = 0;
$max['itemo'] = [];
$max['itemb'] = [];
$max['totalowned'] = 0;
$max['avgowned'] = 0;
$max['numowned'] = 0;
foreach ($s as $item) {
    if ($item['owned'] <= 0) {
        continue;
    }

    $todaysPrice = $item['prices'][count($item['prices']) - 1];
    $tomorrowsPrice = $d > 0 ? $todaysPrice + $item['average'] : 0;
    $max['totalowned'] += $tomorrowsPrice * $item['owned'];
    $max['avgowned'] += $todaysPrice * $item['owned'];
    $max['numowned'] += $item['owned'];

    $maxCurrent = max($todaysPrice * $item['owned'], $tomorrowsPrice * $item['owned']);
    $max['owned'] = max($max['owned'], $maxCurrent);
    if ($max['owned'] == $maxCurrent) {
        $max['itemo'] = $item;
    }
}

if ($max['numowned'] > 0) {
    $max['avgowned'] /= $max['numowned'];
}

# Hypothetical buy
foreach ($s as $item) {
    $todaysPrice = $item['prices'][count($item['prices']) - 1];
    $tomorrowsPrice = $d > 0 ? $todaysPrice + $item['average'] : 0;

    $i = 0;
    while ($todaysPrice * $i <= $m) {
        $i++;
    }
    $i--;

    $maxCurrent = max(($todaysPrice * $i) + ($item['owned'] * $todaysPrice), ($tomorrowsPrice * $i) + ($item['owned'] * $tomorrowsPrice));
    $max['buyed'] = max($max['buyed'], $maxCurrent);
    if ($max['buyed'] == $maxCurrent) {
        $max['itemb'] = $item;
        $max['numbuyed'] = $i;
    }
}

$t = []; # Performed transactions

# Buy and sell
if ($max['numbuyed'] > 0 && $max['buyed'] > $max['totalowned']) {
    # Buy
    $t[] = "{$max['itemb']['name']} BUY {$max['numbuyed']}\n";
    
    if (!empty($max['itemo']) && $max['itemb'] != $max['itemo']) {
        # Sell
        $t[] = "{$max['itemo']['name']} SELL {$max['itemo']['owned']}\n";
    }
}

# Sell
foreach ($s as $item) {
    if ($item['owned'] <= 0) {
        continue;
    }

    $todaysPrice = $item['prices'][count($item['prices']) - 1];
    if ($todaysPrice < $max['avgowned']) {
        $t[] = "{$item['name']} SELL {$item['owned']}\n";
    }
}

echo count($t). "\n";
if (count($t) > 0) {
    foreach ($t as $i) {
        echo $i;
    }
}

?>

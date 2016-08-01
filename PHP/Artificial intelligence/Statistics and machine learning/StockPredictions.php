<?php
# https://www.hackerrank.com/challenges/stockprediction

$fp = fopen("php://stdin", "r");
/* Enter your code here. Read input from STDIN. Print output to STDOUT */

$temp = fgets($fp);
$temp = explode(' ', $temp);
$m = $temp[0]; # Amount of money you could spend that day
$k = $temp[1]; # Number of different stocks available for buying or selling
$d = $temp[2]; # Number of remaining days for trading stocks

for ($i = 0; $i < $k; $i++) {
    $temp = fgets($fp);
    $temp = explode(' ', $temp);
    $name = $temp[0]; # The name of the stock (a string).
    $owned = $temp[1]; # The number of shares you own of that stock.
    $prices = $temp[2]; # 5 space separated numbers representing the stock's price for the last 5 days. These are ordered from oldest to newest, so the last number is the current stock price
}
?>

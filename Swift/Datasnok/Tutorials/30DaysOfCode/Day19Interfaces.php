<?php
/*
Objective 
Today, we're learning about Interfaces. Check out the Tutorial tab for learning materials and an instructional video!

Task 
The AdvancedArithmetic interface and the method declaration for the abstract int divisorSum(int n) method are provided for you in the editor below. Write the Calculator class, which implements the AdvancedArithmetic interface. The implementation for the divisorSum method must be public and take an integer parameter, , and return the sum of all its divisors.

Note: Because we are writing multiple classes in the same file, do not use an access modifier (e.g.: public) in your class declaration (or your code will not compile); however, you must use the public access modifier before your method declaration for it to be accessible by the other classes in the file.

Input Format

A single line containing an integer, .

Constraints


Output Format

You are not responsible for printing anything to stdout. The locked Solution class in the editor below will call your code and print the necessary output.

Sample Input

6
Sample Output

I implemented: AdvancedArithmetic
12
Explanation

The integer  is evenly divisible by , , , and . Our divisorSum method should return the sum of these numbers, which is . The Solution class then prints  on the first line, followed by the sum returned by divisorSum (which is ) on the second line.
*/

class Day19Interfaces
{
	function __construct()
	{
		$n = intval(fgets(STDIN));
		$myCalculator = new Calculator();
		if ($myCalculator instanceof AdvancedArithmetic) { //checking if Calculator has implemented AdvancedArithemtic
			$sum = $myCalculator->divisorSum($n);
			echo "I implemented: AdvancedArithmetic\n{$sum}";
		} else {
			echo "Wrong answer"; // You will get this output if you dont implement
		}
	}
}

interface AdvancedArithmetic
{
	public function divisorSum($n);
}

class Calculator implements AdvancedArithmetic
{
	public function divisorSum($n)
	{
		$sum = 0;
		for ($i = 1; $i <= $n; $i++) {
			if ($n % $i == 0) {
				$sum += $i;
			}
		}

		return $sum;
	}
}

new Day19Interfaces();
?>

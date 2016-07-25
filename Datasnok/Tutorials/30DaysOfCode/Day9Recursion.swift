//
//  Day9Recursion.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/6/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today, we're learning and practicing an algorithmic concept called Recursion. Check out the Tutorial tab for learning materials and an instructional video!

Recursive Method for Calculating Factorial

Task
Write a factorial function that takes a positive integer,  as a parameter and prints the result of  ( factorial).

Note: If you fail to use recursion or fail to name your recursive function factorial or Factorial, you will get a score of .

Input Format

A single integer,  (the argument to pass to factorial).

Constraints


Your submission must contain a recursive function named factorial.
Output Format

Print a single integer denoting .

Sample Input

3
Sample Output

6
Explanation

Consider the following steps:




From steps  and , we can say ; then when we apply the value from  to step , we get . Thus, we print  as our answer.
*/

class Day9Recursion {
	init() {
		var n = Int(readLine()!)!
		n = factorial(n)
		print(n)
	}
	
	func factorial(n: Int) -> Int {
		// End recursion
		if n <= 1 {
			return 1
		}
		
		// Recursion
		return n * factorial(n - 1)
	}
}

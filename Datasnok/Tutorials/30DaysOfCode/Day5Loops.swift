//
//  Day5Loops.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/2/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
In this challenge, we're going to use loops to help us do some simple math. Check out the Tutorial tab to learn more.

Task
Given an integer, , print its first  multiples. Each multiple  (where ) should be printed on a new line in the form: N x i = result.

Input Format

A single integer, .

Constraints


Output Format

Print  lines of output; each line  (where ) contains the  of  in the form:
N x i = result.

Sample Input

2
Sample Output

2 x 1 = 2
2 x 2 = 4
2 x 3 = 6
2 x 4 = 8
2 x 5 = 10
2 x 6 = 12
2 x 7 = 14
2 x 8 = 16
2 x 9 = 18
2 x 10 = 20
*/

class Day5Loops {
	init() {
		// Input
		let n = Int(readLine()!)!
		
		// Print the first ten multiples
		for i in 1 ... 10 {
			print("\(n) x \(i) = \(n * i)")
		}
	}
}

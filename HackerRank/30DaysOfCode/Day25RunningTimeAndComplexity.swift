//
//  Day25RunningTimeAndComplexity.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/22/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today we're learning about running time! Check out the Tutorial tab for learning materials and an instructional video!

Task
A prime is a natural number greater than  that has no positive divisors other than  and itself. Given a number, , determine and print whether it's  or .

Note: If possible, try to come up with a  primality algorithm, or see what sort of optimizations you come up with for an  algorithm. Be sure to check out the Editorial after submitting your code!

Input Format

The first line contains an integer, , the number of test cases.
Each of the  subsequent lines contains an integer, , to be tested for primality.

Constraints



Output Format

For each test case, print whether  is  or  on a new line.

Sample Input

3
12
5
7
Sample Output

Not prime
Prime
Prime
Explanation

Test Case 0: .
is divisible by numbers other than  and itself (i.e.: , , ), so we print  on a new line.

Test Case 1: .
is only divisible  and itself, so we print  on a new line.

Test Case 2: .
is only divisible  and itself, so we print  on a new line.
*/

class Day25RunningTimeAndComplexity {
	init() {
		let t = Int(readLine()!)!
		for _ in 1 ... t {
			let n = Int(readLine()!)!
			var i = 2
			var prime = n > 1
			while i * i <= n {
				if n % i == 0 {
					prime = false
					break
				}
				i += 1
			}
			
			if prime {
				print("Prime")
			} else {
				print("Not prime")
			}
		}
	}
}

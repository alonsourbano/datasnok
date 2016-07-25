//
//  Day10BinaryNumbers.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/7/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today, we're working with binary numbers. Check out the Tutorial tab for learning materials and an instructional video!

Task
Given a base- integer, , convert it to binary (base-). Then find and print the base- integer denoting the maximum number of consecutive 's in 's binary representation.

Input Format

A single integer, .

Constraints


Output Format

Print a single base- integer denoting the maximum number of consecutive 's in the binary representation of .

Sample Input 1

5
Sample Output 1

1
Sample Input 2

13
Sample Output 2

2
Explanation

Sample Case 1:
The binary representation of  is , so the maximum number of consecutive 's is .

Sample Case 2:
The binary representation of  is , so the maximum number of consecutive 's is .
*/

class Day10BinaryNumbers {
	init() {
		let n = Int(readLine()!)! // Number
		let s = String(n, radix: 2) // Convert number to binary and keep it as a string representation
		var i1 = 0
		var i2 = 0
		
		// Loop in reverse order and count the consecutive 1's
		for c in s.characters.reverse() {
			if c == "0" {
				break
			}
			i1 += 1
		}
		
		// Loop and count the consecutive 1's
		for c in s.characters {
			if c == "0" {
				break
			}
			i2 += 1
		}
		
		// Print the biggest consecutive ammount of 1's
		if i1 > i2 {
			print(i1)
		} else {
			print(i2)
		}
	}
}

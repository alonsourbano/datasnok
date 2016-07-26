//
//  Day29BitwiseAnd.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/26/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Welcome to the last day! Today, we're discussing bitwise operations. Check out the Tutorial tab for learning materials and an instructional video!

Task
Given set . Find two integers,  and  (where ), from set  such that the value of is the maximum possible and also less than a given integer, . In this case,  represents the bitwise AND operator.

Input Format

The first line contains an integer, , the number of test cases.
Each of the  subsequent lines defines a test case as  space-separated integers,  and , respectively.

Constraints




Output Format

For each test case, print the maximum possible value of   on a new line.

Sample Input

3
5 2
8 5
2 2
Sample Output

1
4
0
Explanation



All possible values of  and  are:











The maximum possible value of  that is also  is , so we print  on a new line.
*/

import Foundation

class Day29BitwiseAnd {
	init() {
		let t = Int(readLine()!)! // Test cases
		for _ in 1 ... t {
			let input = readLine()!.componentsSeparatedByString(" ").map{ Int($0)! }
			let n = input[0]
			let k = input[1]
			var max = 0
			
			outer: for i in 1 ... n - 1 {
				for j in i + 1 ... n {
					if max + 1 == k {
						// If maximum number is one less than K, it makes no sense to keep looking
						break outer
					}
					
					let m = i & j
					if m > max && m < k {
						// Current number is greater than current maximum
						max = m
					}
				}
			}
			
			print(max)
		}
	}
}

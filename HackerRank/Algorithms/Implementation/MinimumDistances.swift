//
//  MinimumDistances.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/7/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Consider an array of  integers, . The distance between two indices,  and , is denoted by .

Given , find the minimum  such that  and . In other words, find the minimum distance between any pair of equal elements in the array. If no such value exists, print .

Note:  denotes the absolute value of .

Input Format

The first line contains an integer, , denoting the size of array .
The second line contains  space-separated integers describing the respective elements in array .

Constraints



Output Format

Print a single integer denoting the minimum  in ; if no such value exists, print .

Sample Input

6
7 1 3 4 1 7
Sample Output

3
Explanation
Here, we have two options:

and  are both , so .
and  are both , so .
The answer is .
*/

import Foundation

class MinimumDistances {
	init() {
		let _ = Int(readLine()!)! // n
		let arr = readLine()!.characters.split(" ").map({ Int(String($0)) })
		var min = 2000 // Constrain: n cannot be more than 10^3, so we use a bigger number
		
		for i in 0 ..< arr.count - 1 {
			for j in i + 1 ..< arr.count {
				if arr[i] == arr[j] {
					if j - i < min {
						min = j - i
					}
				}
			}
		}
		
		if min < 2000 {
			print(min)
		} else {
			print(-1)
		}
	}
}

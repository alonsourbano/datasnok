//
//  SuperReducedString.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/6/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Shil has a string, , consisting of  lowercase English letters. In one operation, he can delete any pair of adjacent letters with same value. For example, string "" would become either "" or "" after  operation.

Shil wants to reduce  as much as possible. To do this, he will repeat the above operation as many times as it can be performed. Help Shil out by finding and printing 's non-reducible form!

Note: If the final string is empty, print .

Input Format

A single string, .

Constraints


Output Format

If the final string is empty, print ; otherwise, print the final non-reducible string.

Sample Input 0

aaabccddd
Sample Output 0

abd
Sample Input 1

baab
Sample Output 1

Empty String
Sample Input 2

aa
Sample Output 2

Empty String
Explanation

Sample Case 0:
Shil can perform the following sequence of operations to get the final string:




Thus, we print .

Sample Case 1:
Shil can perform the following sequence of operations to get the final string:



*/

class SuperReducedString {
	init() {
		let s = readLine()!
		var arr = Array(s.characters)
		
		var i = 0
		var j = 1
		var changed = false
		while i < arr.count {
			if j == arr.count && changed {
				i = 0
				j = i + 1
				changed = false
			}
			
			if i >= arr.count || j >= arr.count {
				break
			}
				
			if arr[i] == arr[j] {
				arr.removeAtIndex(j)
				arr.removeAtIndex(i)
				if i > 0 {
					i -= 1
					j = i + 1
				}
				changed = true
			} else {
				i += 1
				j = i + 1
			}
		}
		
		if arr.count == 0 {
			print("Empty String")
		} else {
			for c in arr {
				print(c, terminator: "")
			}
			print()
		}
	}
}

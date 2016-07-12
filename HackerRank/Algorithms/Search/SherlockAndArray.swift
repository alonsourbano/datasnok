//
//  SherlockAndArray.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/11/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Watson gives Sherlock an array  of length . Then he asks him to determine if there exists an element in the array such that the sum of the elements on its left is equal to the sum of the elements on its right. If there are no elements to the left/right, then the sum is considered to be zero.
Formally, find an , such that, 12i-1  i+1i+2N.

Input Format
The first line contains , the number of test cases. For each test case, the first line contains , the number of elements in the array . The second line for each test case contains  space-separated integers, denoting the array .

Output Format
For each test case print YES if there exists an element in the array, such that the sum of the elements on its left is equal to the sum of the elements on its right; otherwise print NO.

Constraints


i


Sample Input

2
3
1 2 3
4
1 2 3 3
Sample Output

NO
YES
Explanation
For the first test case, no such index exists.
For the second test case, , therefore index  satisfies the given conditions.
*/

class SherlockAndArray {
	init() {
		let t = Int(readLine()!)!
		for _ in 1 ... t {
			_ = Int(readLine()!)!
			let arr = readLine()!.characters.split(" ").map({ Int(String($0))! })
			var found = false
			for i in 0 ..< arr.count {
				var s1: Int!
				var s2: Int!
				
				if i > 0 {
					s1 = Array(arr[0 ... i - 1]).reduce(0, combine: +)
				} else {
					s1 = 0
				}
				
				if i < arr.count - 1 {
					s2 = Array(arr[i + 1 ... arr.count - 1]).reduce(0, combine: +)
				} else {
					s2 = 0
				}
				
				if s1 == s2 {
					found = true
					break
				}
			}
			
			if found {
				print("YES")
			} else {
				print("NO")
			}
		}
	}
}

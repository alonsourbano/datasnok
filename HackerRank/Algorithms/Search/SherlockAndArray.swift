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
	private var left = Array<Int>()
	private var right = Array<Int>()
	
	init() {
		let t = Int(readLine()!)!
		for _ in 1 ... t {
			_ = Int(readLine()!)!
			let arr = readLine()!.characters.split(" ").map({ Int(String($0))! })
			left = Array<Int>()
			right = Array<Int>(count: arr.count, repeatedValue: -1)
			var found = false
			for i in 0 ..< arr.count {
				let l = sumAllLeft(arr, i: i)
				let r = sumAllRight(arr, i: i)
				if l == r {
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
	
	func sumAllLeft(a: Array<Int>, i: Int) -> Int {
		if i == 0 {
			left.insert(0, atIndex: 0)
			return 0
		}
		
		if left.indices.contains(i) {
			return left[i]
		}
		
		if left.indices.contains(i - 1) {
			let s = left[i - 1] + a[i - 1]
			left.insert(s, atIndex: i)
			return s
		}
		
		return 0
	}
	
	func sumAllRight(a: Array<Int>, i: Int) -> Int {
		if i == a.count - 1 {
			return 0
		}
		
		if right[i] > -1 {
			return right[i]
		}
		
		if right[i + 1] > -1 {
			let s = right[i + 1] + a[i + 1]
			right[i] = s
			return s
		}
		
		let s = sumAllRight(a, i: i + 1) + a[i + 1]
		right[i] = s
		return s
	}
}

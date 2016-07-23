//
//  SherlockAndArray.swift
//  Datasnok
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

import Foundation

class SherlockAndArray {
	init() {
		let t = Int(readLine()!)!
		for _ in 1 ... t {
			_ = Int(readLine()!)!
			let arr = readLine()!.characters.split(" ").map({ Int(String($0))! })
			if arr.count == 1 {
				print("YES")
				continue
			}
			var found = false
			let k = Int(floor(sqrt(Double(arr.count)))) // Slices
			var m = Array<Int>(count: (arr.count / k) + 1, repeatedValue: 0)
			if arr.count - k * k > 0 {
				m.append(0)
			}
			for i in 0 ..< arr.count {
				m[i/k] += arr[i]
			}
			
			for i in 1 ..< arr.count - 1 {
				var left = 0
				var right = 0
				
				// Left
				
				for j in 0 ..< m.count {
					if i >= k * (j + 1) {
						left += m[j]
					} else {
						break
					}
				}
				
				for j in i / k * k ..< i {
					if i % k != 0 {
						left += arr[j]
					}
				}
				
				// Right
				
				for j in (1 ..< m.count).reverse() {
					if i < k * j {
						right += m[j]
					} else {
						break
					}
				}
				
				for j in i + 1 ..< ((i / k) + 1) * k {
					if (i + 1) % k != 0 && j < arr.count {
						right += arr[j]
					}
				}
				
				if left == right {
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

//
//  TheMaximumSubarray.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/8/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Given an array  of  elements, find the maximum possible sum of a

Contiguous subarray
Non-contiguous (not necessarily contiguous) subarray.
Empty subarrays/subsequences should not be considered.

Input Format

First line of the input has an integer .  cases follow.
Each test case begins with an integer . In the next line,  integers follow representing the elements of array .

Constraints:




The subarray and subsequences you consider should have at least one element.

Output Format

Two, space separated, integers denoting the maximum contiguous and non-contiguous subarray. At least one integer should be selected and put into the subarrays (this may be required in cases where all elements are negative).

Sample Input

2
4
1 2 3 4
6
2 -1 2 3 4 -5
Sample Output

10 10
10 11
Explanation

In the first case:
The max sum for both contiguous and non-contiguous elements is the sum of ALL the elements (as they are all positive).

In the second case:
[2 -1 2 3 4] --> This forms the contiguous sub-array with the maximum sum.
For the max sum of a not-necessarily-contiguous group of elements, simply add all the positive elements.
*/

class TheMaximumSubarray {
	var cache = Dictionary<Int, Dictionary<Int, Int>>()
	
	init() {
		let t = Int(readLine()!)!
		
		for tc in 1 ... t {
			print("Test case \(tc)")
			let n = Int(readLine()!)! // n
			let input = readLine()
			let arr = input!.characters.split(" ").map({ Int(String($0))! })
			print("Array of length \(arr.count) and defined \(n)")
			var maxContiguous = -100000002
			
			for i in 0 ..< arr.count {
				cache[i] = Dictionary<Int, Int>()
			}
			
			for _i in 0 ..< arr.count - 1 {
				if let c_i = cache[_i] {
					if let _ = c_i[_i + 1] {
						continue
					}
				}
				
				let s = arr[_i] + arr[_i + 1]
				cache[_i]![_i + 1] = s
			}
			
			for i in 0 ..< arr.count - 1 {
				for j in (i + 1 ..< arr.count).reverse() {
					let m = maxSumBottom(arr, i: i, j: j)
					if m > maxContiguous {
						maxContiguous = m
					}
				}
			}
			
			let maxUncontiguous = arr.filter({ $0 > 0 }).reduce(0, combine: +)
			print("\(maxContiguous) \(maxUncontiguous)")
		}
	}
	
	func maxSumTop(a: Array<Int>, i: Int, j: Int) -> Int {
		if let c_i = cache[i] {
			if let c_j = c_i[j] {
				return c_j
			}
		}
		
		if cache[i] == nil {
			cache[i] = Dictionary<Int, Int>()
		}
		
		if i + 1 == j {
			let o = a[i] + a[j]
			
			cache[i]![j] = o
			return o
		}
		
		let o = maxSumTop(a, i: i, j: j - 1) + a[j]
		cache[i]![j] = o
		return o
	}
	
	func maxSumBottom(a: Array<Int>, i: Int, j: Int) -> Int {
		if let c_i = cache[i] {
			if let c_j = c_i[j] {
				return c_j
			}
		}
		
		for x in (i + 2 ... j).reverse() {
			cache[i]![x] = maxSumTop(a, i: i, j: x - 1) + a[x]
		}
		
		return cache[i]![j]!
	}
}

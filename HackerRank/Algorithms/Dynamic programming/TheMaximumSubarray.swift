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
	init() {
		let t = Int(readLine()!)!
		
		for _ in 1 ... t {
			_ = Int(readLine()!)! // n
			let input = readLine()
			let arr = input!.characters.split(" ").map({ Int(String($0))! })
			var maxEndingHere = arr.first!
			var maxSoFar = arr.first!
			
			for i in 1 ..< arr.count {
				maxEndingHere = max(arr[i], maxEndingHere + arr[i])
				maxSoFar = max(maxSoFar, maxEndingHere)
			}

			let possitives = arr.filter({ $0 >= 0 })
			var maxUncontiguous: Int!
			if possitives.count > 0 {
				maxUncontiguous = possitives.reduce(0, combine: +)
			} else {
				maxUncontiguous = arr.maxElement()
			}
			
			print("\(maxSoFar) \(maxUncontiguous)")
		}
	}
}

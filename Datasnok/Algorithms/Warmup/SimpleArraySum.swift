//
//  SimpleArraySum.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 6/28/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Given an array of  integers, can you find the sum of its elements?

Input Format

The first line contains an integer, , denoting the size of the array.
The second line contains  space-separated integers representing the array's elements.

Output Format

Print the sum of the array's elements as a single integer.

Sample Input

6
1 2 3 4 10 11
Sample Output

31
Explanation

We print the sum of the array's elements, which is: .
*/

class SimpleArraySum {
	init() {
		// number of elements
		let n = Int(readLine()!)!
		
		// read array and map the elements to integer
		var arr = readLine()!.componentsSeparatedByString(" ").map{ Int(String($0))! }
		
		// variable to hold the sum of the array elements
		var sum = 0
		
		for i in 0 ..< n {
			// sum the array elements
			sum += arr[i]
		}
		
		// print the array elements
		print(sum)
	}
}

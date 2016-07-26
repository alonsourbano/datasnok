//
//  Day7Arrays.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/4/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today, we're learning about the Array data structure. Check out the Tutorial tab for learning materials and an instructional video!

Task
Given an array, , of  integers, print 's elements in reverse order as a single line of space-separated numbers.

Input Format

The first line contains an integer,  (the size of our array).
The second line contains  space-separated integers describing array 's elements.

Constraints


, where  is the  integer in the array.
Output Format

Print the elements of array  in reverse order as a single line of space-separated numbers.

Sample Input

4
1 4 3 2
Sample Output

2 3 4 1
*/

class Day7Arrays {
	init() {
		// number of elements
		let _ = Int(readLine()!)!
		
		// read array
		var arr = readLine()!.componentsSeparatedByString(" ").map{ String($0) }
		
		// iterate over the array in reverse order and print the elements separated by space
		// Enter your code here. Read input from STDIN. Print output to STDOUT
		arr = arr.reverse()
		print(arr.joinWithSeparator(" "))
	}
}

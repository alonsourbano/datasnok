//
//  Staircase.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 6/28/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Consider a staircase of size :

#
##
###
####
Observe that its base and height are both equal to , and the image is drawn using # symbols and spaces. The last line is not preceded by any spaces.

Write a program that prints a staircase of size .

Input Format

A single integer, , denoting the size of the staircase.

Output Format

Print a staircase of size  using # symbols and spaces.

Note: The last line must have  spaces in it.

Sample Input

6
Sample Output

#
##
###
####
#####
######
Explanation

The staircase is right-aligned, composed of # symbols and spaces, and has a height and width of .
*/

class Staircase {
	init() {
		// read the integer n
		let n = Int(readLine()!)!
		
		for i in 1 ... n {
			print(String(count: n - i, repeatedValue: Character(" ")) + String(count: i, repeatedValue: Character("#")))
		}
	}
}

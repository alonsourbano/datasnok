//
//  DiagonalDifference.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 6/28/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Given a square matrix of size , calculate the absolute difference between the sums of its diagonals.

Input Format

The first line contains a single integer, . The next  lines denote the matrix's rows, with each line containing space-separated integers describing the columns.

Output Format

Print the absolute difference between the two sums of the matrix's diagonals as a single integer.

Sample Input

3
11 2 4
4 5 6
10 8 -12
Sample Output

15
Explanation

The primary diagonal is:
11
5
-12

Sum across the primary diagonal: 11 + 5 - 12 = 4

The secondary diagonal is:
4
5
10
Sum across the secondary diagonal: 4 + 5 + 10 = 19
Difference: |4 - 19| = 15
*/

class DiagonalDifference {
	init() {
		// read the integer n
		let n = Int(readLine()!)!
		
		// declare 2d array
		var arr : [[Int]] = []
		
		// read array row-by-row
		for _ in 0 ..< n {
			arr.append(readLine()!.characters.split(" ").map{Int(String($0))!})
		}
		
		// declare sums
		var d1 = 0
		var d2 = 0
		
		// sum diagonals
		for i in 0 ..< n {
			d1 += arr[i][i]
			d2 += arr[n - i - 1][i]
		}
		
		print(abs(d2 - d1))
	}
}

//
//  Day112DArrays.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/8/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today, we're building on our knowledge of Arrays by adding another dimension. Check out the Tutorial tab for learning materials and an instructional video!

Context
Given a  2D Array, :

1 1 1 0 0 0
0 1 0 0 0 0
1 1 1 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
We define an hourglass in  to be a subset of values with indices falling in this pattern in 's graphical representation:

a b c
d
e f g
There are  hourglasses in , and an hourglass sum is the sum of an hourglass' values.

Task
Calculate the hourglass sum for every hourglass in , then print the maximum hourglass sum.

Input Format

There are  lines of input, where each line contains  space-separated integers describing 2D Array ; every value in  will be in the inclusive range of  to .

Constraints



Output Format

Print the largest (maximum) hourglass sum found in .

Sample Input

1 1 1 0 0 0
0 1 0 0 0 0
1 1 1 0 0 0
0 0 2 4 4 0
0 0 0 2 0 0
0 0 1 2 4 0
Sample Output

19
Explanation

contains the following hourglasses:

1 1 1   1 1 0   1 0 0   0 0 0
1       0       0       0
1 1 1   1 1 0   1 0 0   0 0 0

0 1 0   1 0 0   0 0 0   0 0 0
1       1       0       0
0 0 2   0 2 4   2 4 4   4 4 0

1 1 1   1 1 0   1 0 0   0 0 0
0       2       4       4
0 0 0   0 0 2   0 2 0   2 0 0

0 0 2   0 2 4   2 4 4   4 4 0
0       0       2       0
0 0 1   0 1 2   1 2 4   2 4 0
The hourglass with the maximum sum () is:

2 4 4
2
1 2 4
*/

class Day112DArrays {
	init() {
		var input = Array<Array<Int>>()
		for _ in 1 ... 6 {
			let arr = readLine()!.characters.split(" ").map({ Int(String($0))! })
			input.append(arr)
		}
		
		var max = -200
		
		for i in 0 ..< input.count - 2 {
			for j in 0 ..< input[i].count - 2 {
				let a = (input[i][j], input[i][j + 1], input[i][j + 2])
				let b = (input[i + 1][j + 1])
				let c = (input[i + 2][j], input[i + 2][j + 1], input[i + 2][j + 2])
				let hourglass = (a, b, c)
				
				let sum = hourglass.0.0 + hourglass.0.1 + hourglass.0.2 + hourglass.1 + hourglass.2.0 + hourglass.2.1 + hourglass.2.2
				if sum > max {
					max = sum
				}
			}
		}
		
		print(max)
	}
}

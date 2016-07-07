//
//  DivisibleSumPairs.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 6/30/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
You are given an array of  integers, , and a positive integer, . Find and print the number of pairs where  and  +  is evenly divisible by .

Input Format

The first line contains  space-separated integers,  and , respectively.
The second line contains  space-separated integers describing the respective values of .

Constraints




Output Format

Print the number of  pairs where  and  +  is evenly divisible by .

Sample Input

6 3
1 3 2 6 1 2
Sample Output

5
Explanation

Here are the  valid pairs:

*/

class DivisibleSumPairs {
	init() {
		var arr = readLine()!.characters.split(" ").map{Int(String($0))!}
		
		let k = arr[1]
		
		arr = readLine()!.characters.split(" ").map{Int(String($0))!}
		var c = 0
		for i in 0 ..< arr.count - 1 {
			for j in i + 1 ..< arr.count {
				if i < j && (arr[i] + arr[j]) % k == 0 {
					c += 1
				}
			}
		}
		print(c)
	}
}

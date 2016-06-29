//
//  SherlockAndTheBeast.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 6/28/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Sherlock Holmes suspects his archenemy, Professor Moriarty, is once again plotting something diabolical. Sherlock's companion, Dr. Watson, suggests Moriarty may be responsible for MI6's recent issues with their supercomputer, The Beast.

Shortly after resolving to investigate, Sherlock receives a note from Moriarty boasting about infecting The Beast with a virus; however, he also gives him a clue—a number, . Sherlock determines the key to removing the virus is to find the largest Decent Number having  digits.

A Decent Number has the following properties:

Its digits can only be 3's and/or 5's.
The number of 3's it contains is divisible by 5.
The number of 5's it contains is divisible by 3.
If there are more than one such number, we pick the largest one.
Moriarty's virus shows a clock counting down to The Beast's destruction, and time is running out fast. Your task is to help Sherlock find the key before The Beast is destroyed!

Constraints




Input Format

The first line is an integer, , denoting the number of test cases.

The  subsequent lines each contain an integer, , detailing the number of digits in the number.

Output Format

Print the largest Decent Number having  digits; if no such number exists, tell Sherlock by printing -1.

Sample Input

4
1
3
5
11
Sample Output

-1
555
33333
55555533333
Explanation

For , there is no decent number having  digit (so we print ).
For ,  is the only possible number. The number  appears three times in this number, so our count of 's is evenly divisible by  (Decent Number Property 3).
For ,  is the only possible number. The number  appears five times in this number, so our count of 's is evenly divisible by  (Decent Number Property 2).
For ,  and all permutations of these digits are valid numbers; among them, the given number is the largest one.
*/

class SherlockAndTheBeast {
	init() {
		let t = Int(readLine()!)!
		
		for _ in 1 ... t {
			let n = readLine()!.characters.split(" ").map{Int(String($0))!}
		}
	}
}

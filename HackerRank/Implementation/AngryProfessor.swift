//
//  AngryProfessor.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 6/28/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
A Discrete Mathematics professor has a class of  students. Frustrated with their lack of discipline, he decides to cancel class if fewer than  students are present when class starts.

Given the arrival time of each student, determine if the class is canceled.

Input Format

The first line of input contains , the number of test cases.

Each test case consists of two lines. The first line has two space-separated integers,  (students in the class) and (the cancelation threshold).
The second line contains  space-separated integers () describing the arrival times for each student.

Note: Non-positive arrival times () indicate the student arrived early or on time; positive arrival times () indicate the student arrived  minutes late.

Output Format

For each test case, print the word YES if the class is canceled or NO if it is not.

Constraints





Note
If a student arrives exactly on time , the student is considered to have entered before the class started.

Sample Input

2
4 3
-1 -3 4 2
4 2
0 -1 2 1
Sample Output

YES
NO
Explanation

For the first test case, . The professor wants at least  students in attendance, but only  have arrived on time ( and ). Thus, the class is canceled.

For the second test case, . The professor wants at least  students in attendance, and there are  who have arrived on time ( and ). Thus, the class is not canceled.
*/

class AngryProfessor {
	init() {
		// number of test cases
		let t = Int(readLine()!)!
		
		for _ in 1 ... t {
			// total of students and cancelation threshold
			var arr = readLine()!.characters.split(" ").map{Int(String($0))!}
			let k = arr[1]
			
			// arrival times
			arr = readLine()!.characters.split(" ").map{Int(String($0))!}
			var o = 0
			for a in arr {
				if a <= 0 {
					o += 1
				}
				
				if o >= k {
					print("NO")
					break
				}
			}
			
			if o < k {
				print("YES")
			}
		}
	}
}

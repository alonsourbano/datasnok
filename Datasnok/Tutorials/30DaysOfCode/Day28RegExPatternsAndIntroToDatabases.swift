//
//  Day28RegExPatternsAndIntroToDatabases.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/25/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today, we're working with regular expressions. Check out the Tutorial tab for learning materials and an instructional video!

Task
Consider a database table, Emails, which has the attributes First Name and Email ID. Given  rows of data simulating the Emails table, print an alphabetically-ordered list of people whose email address ends in .

Input Format

The first line contains an integer, , total number of rows in the table.
Each of the  subsequent lines contains  space-separated strings denoting a person's first name and email ID, respectively.

Constraints


Each of the first names consists of lower case letters  only.
Each of the email IDs consists of lower case letters ,  and  only.
The length of the first name is no longer than 20.
The length of the email ID is no longer than 50.
Output Format

Print an alphabetically-ordered list of first names for every user with a gmail account. Each name must be printed on a new line.

Sample Input

6
riya riya@gmail.com
julia julia@julia.me
julia sjulia@gmail.com
julia julia@gmail.com
samantha samantha@gmail.com
tanya tanya@gmail.com
Sample Output

julia
julia
riya
samantha
tanya
*/

import Foundation

class Day28RegExPatternsAndIntroToDatabases {
	init() {
		let n = Int(readLine()!)!
		var d = [(name: String, email: String)]()
		for _ in 1 ... n {
			let arr = readLine()!.characters.split(" ").map{ String($0) }
			d.append((name: arr[0], email: arr[1]))
		}
		
		var f = [String]()
		for (name, email) in d {
			if email.rangeOfString(".*@gmail.com", options: .RegularExpressionSearch) != nil {
				f.append(name)
			}
		}
		
		f = f.sort()
		_ = f.map{ print($0) }
	}
}

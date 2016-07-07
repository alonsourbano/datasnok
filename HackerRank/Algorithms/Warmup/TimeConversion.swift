//
//  TimeConversion.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 6/28/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Given a time in AM/PM format, convert it to military (-hour) time.

Note: Midnight is  on a -hour clock, and  on a -hour clock. Noon is  on a -hour clock, and  on a -hour clock.

Input Format

A single string containing a time in -hour clock format (i.e.:  or ), where .

Output Format

Convert and print the given time in -hour format, where .

Sample Input

07:05:45PM
Sample Output

19:05:45
*/

import Foundation

class TimeConversion {
	init() {
		// Read the string
		var s = readLine()!
		
		let t = s.substringFromIndex(s.endIndex.predecessor().predecessor())
		s = s.stringByReplacingOccurrencesOfString(t, withString: "")
		var split = s.componentsSeparatedByString(":")
		if t.uppercaseString == "PM" {
			split[0] = String(Int(split[0])! + 12)
			if split[0] == "24" {
				split[0] = "12"
			}
		} else {
			if split[0] == "12" {
				split[0] = "0"
			}
		}
		for i in 0 ..< split.count {
			if split[i].characters.count == 1 {
				split[i] = "0\(split[i])"
			}
		}
		s = split.joinWithSeparator(":")
		
		print(s)
	}
}

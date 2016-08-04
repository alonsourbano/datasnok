//
//  Pangrams.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 8/4/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//
// https://www.hackerrank.com/challenges/pangrams

import Foundation

class Pangrams {
	init() {
		let s = readLine()!.uppercaseString
		let a = "QWERTYUIOPASDFGHJKLZXCVBNM".characters.map{ String($0) }
		var pangram = true
		
		for c in a {
			if !s.containsString(c) {
				pangram = false
				break
			}
		}
		
		if pangram {
			print("pangram")
		} else {
			print("not pangram")
		}
	}
}

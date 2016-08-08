//
//  CookieParty.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 8/8/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//
// https://www.hackerrank.com/contests/w22/challenges/cookie-party

import Foundation

class CookieParty {
	init() {
		let input = readLine()!.componentsSeparatedByString(" ").map{ Int($0)! }
		let n = input.first!
		let m = input.last!
		
		if m == n {
			print(0)
		} else {
			let x = m % n
			print(n - x)
		}
	}
}

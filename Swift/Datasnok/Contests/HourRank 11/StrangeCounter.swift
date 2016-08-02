//
//  StrangeCounter.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 8/2/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//
// https://www.hackerrank.com/contests/hourrank-11/challenges/strange-code

import Foundation

class StrangeCounter {
	init() {
		let t = Int(readLine()!)!
		var r = 3
		var min = 1
		var max = r
		while max < t {
			min = max + 1
			r *= 2
			max += r
		}
		
		min = t - min
		r -= min
		
		print(r)
	}
}

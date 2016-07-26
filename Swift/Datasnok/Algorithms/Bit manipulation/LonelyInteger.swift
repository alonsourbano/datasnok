//
//  LonelyInteger.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/25/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

// https://www.hackerrank.com/challenges/lonely-integer

class LonelyInteger {
	init() {
		let _ = Int(readLine()!)! // N, not used in Swift, its value will be omitted
		var a = readLine()!.characters.split(" ").map{ Int(String($0))! } // Array A
		var o = a.first!
		for i in 1 ..< a.count {
			o ^= a[i] // XOR
		}
		
		print(o)
	}
}

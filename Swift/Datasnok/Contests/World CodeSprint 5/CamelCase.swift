//
//  CamelCase.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/23/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

// https://www.hackerrank.com/contests/world-codesprint-5/challenges/camelcase

import Foundation

class CamelCase {
	init() {
		let s = readLine()!
		let u = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		let f = s.characters.filter({ u.containsString(String($0)) })
		print(f.count + 1)
	}
}

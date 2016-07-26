//
//  BearAndSteadyGene.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/25/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

// https://www.hackerrank.com/challenges/bear-and-steady-gene

class BearAndSteadyGene {
	init() {
		let n = Int(readLine()!)! // N
		let s = readLine()! // String
		let s2 = s.characters.map{ String($0) } // String as array
		let a = (n / 4) - s2.filter{ $0 == "A" }.count // Missing A (negative means remainder)
		let c = (n / 4) - s2.filter{ $0 == "C" }.count // C
		let g = (n / 4) - s2.filter{ $0 == "G" }.count // G
		let t = (n / 4) - s2.filter{ $0 == "T" }.count // T
		
		if a == 0 && c == 0 && g == 0 && t == 0 {
			// If all are zero there's no need to change anything
			print(0)
		} else {
			
		}
	}
}

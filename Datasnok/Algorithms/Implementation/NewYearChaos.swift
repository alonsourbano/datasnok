//
//  NewYearChaos.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/26/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//
// https://www.hackerrank.com/challenges/new-year-chaos

class NewYearChaos {
	init() {
		let t = Int(readLine()!)! // Test cases
		for _ in 1 ... t {
			let _ = Int(readLine()!)! // N, useless in Swift
			var q = readLine()!.characters.split(" ").map{ Int(String($0))! } // Queue
			var b = [Int](count: q.count + 1, repeatedValue: 0) // Bribes
			var p = true // Not too chaotic
			var s = 0 // Swaps
			var i = 0
			var j = i + 1
			while i < q.count - 1 && j < q.count {
				if q[i] > q[j] {
					if b[q[i]] >= 2 { // Person has already bribed twice
						p = false
						break
					}
					
					b[q[i]] += 1 // Add one bribe for person
					s += 1 // Add one swap
					swap(&q[i], &q[j]) // Swap positions
					i -= 1 // Go check if the moved persons was bribed
					if i < 0 {
						i = 0
					}
					j = i + 1
				} else {
					i += 1
					j = i + 1
				}
			}
			
			
			if p {
				print(s)
			} else {
				print("Too chaotic")
			}
		}
	}
}

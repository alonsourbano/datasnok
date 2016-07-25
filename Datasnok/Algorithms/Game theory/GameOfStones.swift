//
//  GameOfStones.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/25/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

// https://www.hackerrank.com/challenges/game-of-stones-1

class GameOfStones {
	init() {
		let t = Int(readLine()!)!
		let p1 = "First"
		let p2 = "Second"
		for _ in 1 ... t {
			var n = Int(readLine()!)!
			var p1Turn = true
			
			while n >= 2 {
				let move = (a : n - 2, b : n - 3, c : n - 5)
				p1Turn = !p1Turn
			}
		}
	}
}

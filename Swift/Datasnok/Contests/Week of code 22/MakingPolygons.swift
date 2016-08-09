//
//  MakingPolygons.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 8/8/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//
//

import Foundation

class MakingPolygons {
	init() {
		_ = Int(readLine()!)!
		let a = readLine()!.characters.map{ Int(String($0))! }
		let s = getSticksThatNeedSeparation(a)
		if s.count == 0 {
			print(0)
		} else {
			print(0)
		}
	}
	
	func getSticksThatNeedSeparation(a: [Int]) -> [Int] {
		let s = a.reduce(0, combine: +)
		let r = a.filter { $0 >= s / 2 }
		return r
	}
	
	func calculateSticks(a: [Int]) -> Int {
		if a.count == 1 {
			return 2
		}
		
		if a.count == 2 {
			if a[0] == a[1] {
				return 2
			}
			
			return 1
		}
		
		if a.count == 3 {
			if a[0] + a[1] > a[2] && a[1] + a[2] > a[0] && a[0] + a[2] > a[1] {
				return 0
			}
		}
		
		if a.count == 4 {
			if a[0] + a[1] == a[2] + a[3] || a[0] + a[2] == a[1] + a[3] || a[0] + a[3] == a[1] + a[2] {
				return 0
			}
		}
		
		return 0
	}
}

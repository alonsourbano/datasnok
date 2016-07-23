//
//  AVeryBigSum.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 6/28/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

class AVeryBigSum {
	init() {
		// number of elements
		let n = Int(readLine()!)!
		
		// read array and map the elements to integer
		var arr = readLine()!.characters.split(" ").map{Int(String($0))!}
		
		// variable to hold the sum of the array elements
		var sum: Int64 = 0
		
		for i in 0 ..< n {
			// sum the array elements
			sum += arr[i]
		}
		
		// print the array elements
		print(sum)
	}
}

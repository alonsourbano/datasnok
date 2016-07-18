//
//  Day21Generics.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/18/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today we're discussing Generics; be aware that not all languages support this construct, so fewer languages are enabled for this challenge. Check out the Tutorial tab for learning materials and an instructional video!

Task
Write a single generic function named printArray; this function must take an array of generic elements as a parameter (the exception to this is C++, which takes a vector). The locked Solution class in your editor tests your function.

Note: You must use generics to solve this challenge. Do not write overloaded functions.

Input Format

There is no input for this challenge. The locked Solution class in your editor will pass two different types of arrays to your printArray function.

Constraints

You must have exactly  function named printArray.
Output Format

Your printArray function should print each element of its generic array parameter on a new line.
*/

class Day21Generics {
	init() {
		let vInt = [1, 2, 3]
		let vString = ["Hello", "World"]
		
		Printer<Int>().printArray(vInt)
		Printer<String>().printArray(vString)
	}
	
}

// Start of struct Printer
struct Printer<type> {
	func printArray(a: [type]) {
		for i in a {
			print(i)
		}
	}
} // End of struct Printer

//
//  Day17MoreExceptions.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/14/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Yesterday's challenge taught you to manage exceptional situations by using try and catch blocks. In today's challenge, you're going to practice throwing and propagating an exception. Check out the Tutorial tab for learning materials and an instructional video!

Task
Write a Calculator class with a single method: int power(int,int). The power method takes two integers,  and , as parameters and returns the integer result of . If either  or  is negative, then the method must throw an exception with the message: n and p should be non-negative.

Note: Do not use an access modifier (e.g.: public) in the declaration for your Calculator class.

Input Format

Input from stdin is handled for you by the locked stub code in your editor. The first line contains an integer, , the number of test cases. Each of the  subsequent lines describes a test case in  space-separated integers denoting  and , respectively.

Constraints

No Test Case will result in overflow for correctly written code.
Output Format

Output to stdout is handled for you by the locked stub code in your editor. There are  lines of output, where each line contains the result of  as calculated by your Calculator class' power method.

Sample Input

4
3 5
2 4
-1 -2
-1 3
Sample Output

243
16
n and p should be non-negative
n and p should be non-negative
Explanation


:  and  are positive, so power returns the result of , which is .
:  and  are positive, so power returns the result of =, which is .
: Both inputs ( and ) are negative, so power throws an exception and   is printed.
: One of the inputs () is negative, so power throws an exception and   is printed.
*/

import Darwin

class Day17MoreExceptions {
	init() {
		do {
			try self.doIt()
		} catch {
			
		}
	}
	
	func doIt() throws {
		let myCalculator = Calculator()
		var t = Int(readLine()!)!
		
		while t-- > 0 {
			let np = readLine()!.characters.split(" ").map(String.init)
			
			do {
				let ans = try myCalculator.power(Int(np[0])!, p: Int(np[1])!)
				print(ans)
			} catch RangeError.NotInRange(let errorMsg) {
				print(errorMsg)
			}
		}
	}
}

// Start of class Calculator
class Calculator {
	// Start of function power
	func power(n: Int, p: Int) throws -> Int {
		if n < 0 || p < 0 {
			throw RangeError.NotInRange("n and p should be non-negative")
		}
		
		return Int(pow(Double(n), Double(p)))
	} // End of function power
} // End of class Calculator

// Defining enum for throwing error
// throw RangeError.NotInRange... is used to throw the error
enum RangeError : ErrorType {
	case NotInRange(String)
}

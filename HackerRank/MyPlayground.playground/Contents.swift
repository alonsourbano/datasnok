//: Playground - noun: a place where people can play

import Cocoa

// Enter your code here
func factorial(n: Int) -> Int {
	if n <= 1 {
		return 1
	}
	
	return n * factorial(n - 1)
}

var n = 3
n = factorial(n)
print(n)


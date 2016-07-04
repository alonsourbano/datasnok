//: Playground - noun: a place where people can play

import Cocoa

let n = 11

var d = Int64([String](count: n, repeatedValue: "5").joinWithSeparator(""))!
let min = Int64([String](count: n, repeatedValue: "3").joinWithSeparator(""))!
var s = "-1"
var found = false
repeat {
	s = String(d)
	let three = s.characters.filter() { $0 == "3" }.count
	let five = s.characters.filter() { $0 == "5" }.count
	
	if three % 5 == 0 && five % 3 == 0 {
		found = true
	}
	
	d -= 1
} while !found && d > 0 && d > min

if found {
	print(s)
} else {
	print(-1)
}

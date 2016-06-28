//: Playground - noun: a place where people can play

import Cocoa

var s = "12:40:22PM"

let t = s.substringFromIndex(s.endIndex.predecessor().predecessor())
s = s.stringByReplacingOccurrencesOfString(t, withString: "")
var split = s.componentsSeparatedByString(":")
if t.uppercaseString == "PM" {
	split[0] = String(Int(split[0])! + 12)
	if split[0] == "24" {
		split[0] = "12"
	}
} else {
	if split[0] == "12" {
		split[0] = "0"
	}
}
for i in 0 ..< split.count {
	if split[i].characters.count == 1 {
		split[i] = "0\(split[i])"
	}
}
s = split.joinWithSeparator(":")
s

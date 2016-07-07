//: Playground - noun: a place where people can play

let n = 13
let s = String(n, radix: 2)
var o = ""
var i = 0
for c in s.characters {
	if c == "0" {
		break
	}
	i += 1
}
i

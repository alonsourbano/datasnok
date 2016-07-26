//
//  InsertionSortPart2.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/9/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
In Insertion Sort Part 1, you sorted one element into an array. Using the same approach repeatedly, can you sort an entire unsorted array?

Guideline: You already can place an element into a sorted array. How can you use that code to build up a sorted array, one element at a time? Note that in the first step, when you consider an element with just the first element - that is already "sorted" since there's nothing to its left that is smaller.

In this challenge, don't print every time you move an element. Instead, print the array after each iteration of the insertion-sort, i.e., whenever the next element is placed at its correct position.

Since the array composed of just the first element is already "sorted", begin printing from the second element and on.

Input Format
There will be two lines of input:

- the size of the array
- a list of numbers that makes up the array
Output Format
On each line, output the entire array at every iteration.

Constraints



Sample Input

6
1 4 3 5 6 2
Sample Output

1 4 3 5 6 2
1 3 4 5 6 2
1 3 4 5 6 2
1 3 4 5 6 2
1 2 3 4 5 6
Explanation
Insertion Sort checks  first and doesn't need to move it, so it just prints out the array. Next,  is inserted next to , and the array is printed out. This continues one element at a time until the entire array is sorted.

Task
The method insertionSort takes in one parameter: , an unsorted array. Use an Insertion Sort Algorithm to sort the entire array.
*/

class InsertionSortPart2 {
	init() {
		let _ = Int(readLine()!)!
		var arr = readLine()!.componentsSeparatedByString(" ").map{ Int(String($0))! }
		for i in 1 ..< arr.count {
			let a = insertionSort(Array(arr[0 ... i]))
			arr = a + Array(arr[i + 1 ..< arr.count])
			print(arr.map({ String($0) }).joinWithSeparator(" "))
		}
	}
	
	func insertionSort(arr: Array<Int>) -> Array<Int> {
		let e = arr.last!
		var a = arr
		var inserted = false
		for i in (0 ..< a.count - 1).reverse() {
			if e > a[i] {
				a[i + 1] = e
				inserted = true
				break
			} else {
				a[i + 1] = a[i]
			}
		}
		
		if !inserted {
			a[0] = e
		}

		return a
	}
}

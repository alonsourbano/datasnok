//
//  Day20Sorting.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 7/17/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today, we're discussing a simple sorting algorithm called Bubble Sort. Check out the Tutorial tab for learning materials and an instructional video!

Consider the following version of Bubble Sort:

for (int i = 0; i < n; i++) {
int numberOfSwaps = 0;

for (int j = 0; j < n - 1; j++) {
if (a[j] > a[j + 1]) {
swap(a[j], a[j + 1]);
numberOfSwaps++;
}
}

if (numberOfSwaps == 0) {
break;
}
}
Task
Given an array, , of size  containing distinct elements , sort array  in ascending order using the Bubble Sort algorithm above. Once sorted, print the following  lines:


where  is the number of swaps that took place.

where  is the first element in the sorted array.

where  is the last element in the sorted array.
Hint: To complete this challenge, you will need to add a variable that keeps a running tally of all swaps that occur during execution.

Input Format

The first line contains an integer, , denoting the number of elements in array .
The second line contains  space-separated integers describing , where the  integer is , .

Constraints


,
Output Format

There should be  lines of output:


where  is the number of swaps that took place.

where  is the first element in the sorted array.

where  is the last element in the sorted array.
Sample Input 0

3
1 2 3
Sample Output 0

Array is sorted in 0 swaps.
First Element: 1
Last Element: 3
Sample Input 1

3
3 2 1
Sample Output 1

Array is sorted in 3 swaps.
First Element: 1
Last Element: 3
Explanation

Sample Case 1:
The array is already sorted, so  swaps take place and we print the necessary  lines of output shown above.

Sample Case 2:
The array is not sorted, and its initial values are: . The following  swaps take place:




At this point the array is sorted and we print the necessary  lines of output shown above.
*/

class Day20Sorting {
	init() {
		let _ = Int(readLine()!)! // n
		var arr = readLine()!.characters.split(" ").map({ Int(String($0))! })
		var totalSwaps = 0
		
		for _ in 0 ..< arr.count {
			var numberOfSwaps = 0
			for j in 0 ..< arr.count - 1 {
				if arr[j] > arr[j + 1] {
					let a = arr[j]
					arr[j] = arr[j + 1]
					arr[j + 1] = a
					numberOfSwaps += 1
					totalSwaps += 1
				}
			}
			
			if numberOfSwaps == 0 {
				break
			}
		}
		
		print("Array is sorted in \(totalSwaps) swaps.")
		print("First Element: \(arr.first!)")
		print("Last Element: \(arr.last!)")
	}
}

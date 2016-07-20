//
//  Day22BinarySearchTrees.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/19/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Objective
Today, we're working with Binary Search Trees (BSTs). Check out the Tutorial tab for learning materials and an instructional video!

Task
The height of a binary search tree is the number of edges between the tree's root and its furthest leaf. You are given a pointer, , pointing to the root of a binary search tree. Complete the getHeight function provided in your editor so that it returns the height of the binary search tree.

Input Format

The locked stub code in your editor reads the following inputs and assembles them into a binary search tree:
The first line contains an integer, , denoting the number of nodes in the tree.
Each of the  subsequent lines contains an integer, , denoting the value of an element that must be added to the BST.

Output Format

The locked stub code in your editor will print the integer returned by your getHeight function denoting the height of the BST.

Sample Input

7
3
5
2
1
4
6
7
Sample Output

3
Explanation

The input forms the following BST:

BST.png

The longest root-to-leaf path is shown below:

Longest RTL.png

There are  nodes in this path that are connected by  edges, meaning our BST's . Thus, we print  as our answer.
*/

class Day22BinarySearchTrees {
	init() {
		var root: Node22?
		let tree = Tree22()
		
		var t = Int(readLine()!)!
		
		while t > 0 {
			root = tree.insert(root, data: Int(readLine()!)!)
			t = t - 1
		}
		
		print(tree.getHeight(root))
	}
}

// Start of Node class
class Node22 {
	var data: Int
	var left: Node22?
	var right: Node22?
	
	init(d : Int) {
		data  = d
	}
} // End of Node class

// Start of Tree class
class Tree22 {
	func insert(root: Node22?, data: Int) -> Node22? {
		if root == nil {
			return Node22(d: data)
		}
		
		if data <= root?.data {
			root?.left = insert(root?.left, data: data)
		} else {
			root?.right = insert(root?.right, data: data)
		}
		
		return root
	}
	
	func getHeight(root: Node22?) -> Int {
		var q = [(distance: Int, node: Node22)]()
		q.insert((distance: 0, node: root!), atIndex: 0)
		var h = 0
		while !q.isEmpty {
			let current = q.removeFirst()
			if current.distance > h {
				h = current.distance
			}
			
			if let left = current.node.left {
				q.insert((distance: current.distance + 1, node: left), atIndex: 0)
			}
			
			if let right = current.node.right {
				q.insert((distance: current.distance + 1, node: right), atIndex: 0)
			}
		}
		
		return h
	} // End of getHeight function
} // End of Tree class

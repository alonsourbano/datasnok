//
//  Day24MoreLinkedLists.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/21/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

class Day24MoreLinkedLists {
	init() {
		var head: Node?
		let linkedList = LinkedList()
		
		var t = Int(readLine()!)!
		
		while t-- > 0 {
			head = linkedList.insert(head, data: Int(readLine()!)!)
		}
		
		linkedList.display(linkedList.removeDuplicates(head))
	}
}

// Start of class Node
class Node {
	var data: Int
	var next: Node?
	
	init(d: Int) {
		data = d
	}
} // End of class Node

// Start of class LinkedList
class LinkedList {
	func insert(head: Node?, data: Int) -> Node? {
		if head == nil {
			return Node(d: data)
		}
		
		head?.next = insert(head?.next, data: data)
		
		return head
	}
	
	func display(head: Node?) {
		if head != nil {
			print(head!.data, terminator: " ")
			
			display(head?.next)
		}
	}
	
	// Start of function removeDuplicates
	func removeDuplicates(head: Node?) -> Node? {
		if let _ = head {
			var q = Array<Int>()
			var parent = head
			var current = head?.next
			q.append(parent!.data)
			while current != nil {
				if q.contains(current!.data) {
					parent?.next = current?.next
					parent = head
					current = head?.next
					q.removeAll()
					q.append(parent!.data)
				} else {
					q.append(current!.data)
					parent = current
					current = current?.next
				}
			}
		}
		
		return head
	} // End of function removeDuplicates
} // End of class LinkedList

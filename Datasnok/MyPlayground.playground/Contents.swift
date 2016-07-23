//: Playground - noun: a place where people can play


class Node<T> {
	var data: T
	var children: Array<Node<T>>?
	
	init(data: T, children: Array<Node<T>>?) {
		self.data = data
		self.children = children
	}
}

func getNChildren<T>(head: Array<Node<T>>, path: Array<Int>) -> Node<T>? {
	var localPath = path
	// Get the first path and remove it from the array
	let currentPath = localPath.removeFirst()
	
	if head.indices.contains(currentPath) {
		if localPath.isEmpty {
			// If there's no more in the path, return current element
			return head[currentPath]
		} else {
			if head[currentPath].children != nil {
				// We go looking for children
				return getNChildren(head[currentPath].children!, path: localPath)
			} else {
				// There are no more children, but there are more elements in path, so that level doesn't exist
				return nil
			}
		}
		
	} else {
		return nil
	}
}

let root = Node(data: 0, children: nil)
let child1 = Node(data: 1, children: nil)
let child2 = Node(data: 1, children: nil)
root.children = [child1, child2]
let arr = [root]
getNChildren(arr, path: [0, 0, 0, 2])

import Foundation

/**
This problem was asked by Google.

Given the root to a binary tree, implement serialize(root), which serializes the tree into a string, and deserialize(s), which deserializes the string back into the tree.

For example, given the following Node class

class Node:
	def __init__(self, val, left=None, right=None):
		self.val = val
		self.left = left
		self.right = right

The following test should pass:

	node = Node('root', Node('left', Node('left.left')), Node('right'))
	assert deserialize(serialize(node)).left.left.val == 'left.left'
*/

class Node {

	var value: String
	var leftChild: Node?
	var rightChild: Node?

	init(value: String, leftChild: Node? = nil, rightChild: Node? = nil) {
		self.value = value
		self.leftChild = leftChild
		self.rightChild = rightChild
	}

}

/**
Serialization:
We will read the tree in Pre-order traversal and store Node data in a string separated by white-space.
Whenever we meet nil node we will store "nil" string.
*/

/// First visit the Node data, then visit Left Child and then Right Child
func preOrderTraversal(_ root: Node, visit: (String) -> Void) {
	visit(root.value)

	if let leftChild = root.leftChild {
		// Recursive the left child
		preOrderTraversal(leftChild, visit: visit)
	} else {
		visit("nil")
	}

	if let rightChild = root.rightChild {
		// Recursive the right child
		preOrderTraversal(rightChild, visit: visit)
	} else {
		visit("nil")
	}
}

/// Encode a binary tree into a string
func serialize(_ root: Node) -> String {
	var serializedString = ""
	preOrderTraversal(root) { value in
		serializedString += value + " "
	}
	serializedString.removeLast()
	return serializedString
}

/// Decode a string into a binary tree
func deserialize(_ string: String) -> Node? {

	// Aux func
	func buildTree(_ serializedStrings: inout [String]) -> Node? {
		if !serializedStrings.isEmpty {
			let value = serializedStrings.removeLast()
			if value != "nil" {
				let root = Node(value: value)
				root.leftChild = buildTree(&serializedStrings)
				root.rightChild = buildTree(&serializedStrings)
				return root
			}
		}
		return nil
	}

	var serializedStrings = string.split(separator: " ").reversed().map(String.init)
	return buildTree(&serializedStrings)
}


let node = Node(value: "root", leftChild: Node(value: "left", leftChild: Node(value: "left.left")), rightChild: Node(value: "right"))
let serializedString = serialize(node)
let deserializedNode = deserialize(serializedString)
// Assert
assert(deserializedNode?.leftChild?.leftChild?.value == "left.left", "Should be true")

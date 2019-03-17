# Daily Coding Problem
Here is my daily Swift solution for https://dailycodingproblem.com 🤩

Feel free to create a new issue for your question or suggestion 😎

## Problem 1
> This problem was recently asked by Google.

Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

*Bonus: Can you do this in one pass?*

### Solution

[TwoSum.Swift](Solutions/Problem1/TwoSum.swift)

## Problem 2
> This problem was asked by Uber.

Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.

For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].

*Follow-up: what if you can't use division?*

### Solution

[ExclusiveProduct.Swift](Solutions/Problem2/ExclusiveProduct.swift)

## Problem 3
> This problem was asked by Google.

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

### Solution

[SerializeBinaryTree.Swift](Solutions/Problem3/SerializeBinaryTree.swift)

## Problem 5
> This problem was asked by Jane Street.

cons(a, b) constructs a pair, and car(pair) and cdr(pair) returns the first and last element of that pair. For example, car(cons(3, 4)) returns 3, and cdr(cons(3, 4)) returns 4.

Given this implementation of cons:
```python
	def cons(a, b):
		def pair(f):
			return f(a, b)
		return pair
```

Implement car and cdr.

### Solution

[ConstructPair.Swift](Solutions/Problem5/ConstructPair.swift)

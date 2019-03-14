import Foundation

/**
This problem was asked by Uber.

Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.

For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].

Follow-up: what if you can't use division?
*/

func exclusiveProductUsingDivision(of input: [Int]) -> [Int] {
	
	var result = [Int]()
	var prod = 1
	
	for number in input {
		prod *= number
	}
	
	for number in input {
		result.append(prod / number)
	}
	
	return result
}

exclusiveProductUsingDivision(of: [1, 2, 3, 4, 5])
exclusiveProductUsingDivision(of: [3, 2, 1])

func exclusiveProduct(of input: [Int]) -> [Int] {
	var result = [Int]()
	var left = Array(repeating: 1, count: input.count)
	var right = Array(repeating: 1, count: input.count)
	
	for i in 1 ..< input.count {
		// Compute all product of everything to the left of `i`
		left[i] = left[i - 1] * input[i - 1]
		
		// Compute all product of everything to the right of `rightIndex`
		let rightIndex = input.count - i - 1
		right[rightIndex] = right[rightIndex + 1] * input[rightIndex + 1]
	}
	
	// Left * Right
	for i in 0 ..< input.count {
		result.append(left[i] * right[i])
	}
	
	return result
}

exclusiveProduct(of: [1, 2, 3, 4, 5])
exclusiveProduct(of: [3, 2, 1])

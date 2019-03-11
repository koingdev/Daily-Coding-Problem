import Foundation

/**
This problem was recently asked by Google.

Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

Bonus: Can you do this in one pass?
*/

extension Array where Element == Int {

	// Complexity: O(n)
	func hasSumEqual(to k: Int) -> Bool {
		
		var cache = Set<Int>()
		
		for number in self {
			let target = k - number
			// Found ?
			if cache.contains(target) {
				return true
			} else {
				cache.insert(number)
			}
		}
		
		return false
		
	}

}

[].hasSumEqual(to: 3)							// false
[1, 2, 3, 4].hasSumEqual(to: 3)					// true
[0, 1, 2, 3, 5].hasSumEqual(to: 1) 				// true
[10, 11, 33, 0, -1, 8].hasSumEqual(to: 9) 		// true
[0, 0, 0, 0, 1].hasSumEqual(to: 2) 				// false
[1, 2, 3, 4].hasSumEqual(to: 3) 				// true
[0, 1, 2, 3].hasSumEqual(to: 1) 				// true
[10, 3, 33, 0, -1, 8].hasSumEqual(to: 9) 		// true
[0, 0, 0, 0, 1].hasSumEqual(to: 2) 				// false
[0, 0, 0].hasSumEqual(to: 0)					// true

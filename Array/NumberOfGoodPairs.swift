/*

1512. Number of Good Pairs

Given an array of integers nums.

A pair (i,j) is called good if nums[i] == nums[j] and i < j.

Return the number of good pairs.

 

Example 1:

Input: nums = [1,2,3,1,1,3]
Output: 4
Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
Example 2:

Input: nums = [1,1,1,1]
Output: 6
Explanation: Each pair in the array are good.
Example 3:

Input: nums = [1,2,3]
Output: 0
 

Constraints:

1 <= nums.length <= 100
1 <= nums[i] <= 100


*/



/*  Solution 1:              */
/*  Brute Force:             */
// Complexity O(n^2)
func numIdenticalPairs(_ nums: [Int]) -> Int {
    
    var returnValue = 0
    
    (0..<(nums.count - 1)).forEach { (value) in
        ((value + 1)..<nums.count).forEach { (inValue) in
            if nums[value] == nums[inValue] {
                returnValue += 1
            }
        }
    }
     
    return returnValue
}

/* Solution 2:               */
/* Dictionary:               */
/*  Complexity: O(n) */
func numIdenticalPairs(_ nums: [Int]) -> Int {
    
    var dict = [Int: Int]()
    
    nums.forEach {                    //  O(n)
        if let value = dict[$0] {
            dict[$0] = value + 1
        } else {
            dict[$0] = 1
        }
    }
    
    var returnValue = 0
    
    dict.values.forEach {                // O(n)
        returnValue += $0 * ($0 - 1) / 2
    }
    
    return returnValue
    
}
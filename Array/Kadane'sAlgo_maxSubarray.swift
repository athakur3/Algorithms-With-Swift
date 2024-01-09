/*
Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
A subarray is a contiguous part of an array.

Example 1:
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.

Kadanes algo
https://medium.com/@rsinghal757/kadanes-algorithm-dynamic-programming-how-and-why-does-it-work-3fd8849ed73d
*/


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let size = nums.count
        var localMax = 0
        var globalMax = Int.min
        
        for i in 0 ..< size {
            localMax = max(nums[i],nums[i] + localMax)
            if localMax > globalMax{
                globalMax = localMax
            }
        }
        
        return globalMax
    }
}

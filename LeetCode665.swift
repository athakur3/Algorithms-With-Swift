/*
Given an array nums with n integers, your task is to check if it could become non-decreasing by modifying at most 1 element.

We define an array is non-decreasing if nums[i] <= nums[i + 1] holds for every i (0-based) such that (0 <= i <= n - 2).

 

Example 1:

Input: nums = [4,2,3]
Output: true
Explanation: You could modify the first 4 to 1 to get a non-decreasing array.
Example 2:

Input: nums = [4,2,1]
Output: false
Explanation: You can't get a non-decreasing array by modify at most one element.
 

Constraints:

1 <= n <= 10 ^ 4
- 10 ^ 5 <= nums[i] <= 10 ^ 5

*/

class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        
        var A = nums
        var i = 0
        var M = 0
        
        while (i < A.count - 1) {
            
            if A[i + 1] < A[i]  {
                
                if M == 1 {
                    return false
                } else if i == 0 {
                    A[i] = A[i + 1]
                    M += 1
                } else if (i == (A.count - 2)) {
                    A[i + 1] = A[i]
                    M += 1
                } else if A[i + 1] >= A[i - 1] {
                    A[i] = A[i - 1]
                    M += 1
                } else if A[i + 2] >= A[i] {
                    A[i + 1] = A[i]
                    M += 1
                } else {
                    return false
                }
            }
            i += 1
        }
        return true 
    }
}
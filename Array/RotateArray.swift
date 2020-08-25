/*

Leetcode: 189. Rotate Array

Given an array, rotate the array to the right by k steps, where k is non-negative.

Follow up:

Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
Could you do it in-place with O(1) extra space?
 

Example 1:

Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]
Example 2:

Input: nums = [-1,-100,3,99], k = 2
Output: [3,99,-1,-100]
Explanation: 
rotate 1 steps to the right: [99,-1,-100,3]
rotate 2 steps to the right: [3,99,-1,-100]
 

Constraints:

1 <= nums.length <= 2 * 10^4
It's guaranteed that nums[i] fits in a 32 bit-signed integer.
k >= 0

*/


// Purely Swift Solution
func rotate(_ nums: inout [Int], _ k: Int) {
    
    if nums.count < 2 || k == 0 {
        return
    }
    
    (1...k).forEach { value in
        nums.insert(nums.removeLast(), at: 0)
    }
    
}

/**** 
Complexity:  
    -> RemoveLast O(1)
    -> Insert -> O(n)
    -> Overall Time -> O(n)
Space:
    -> In Place O(1) 
****/



// By not using Insert in Swift
func rotate(_ nums: inout [Int], _ k: Int) {
    
    var kMax = k
    
    if k > nums.count {
        kMax = k % nums.count
    }
    
    if nums.count < 2 || kMax == 0 {
        return
    }
    
    let length = nums.count
    
    (0...(length - 1)).forEach {
        
        if $0 < (length - kMax - 1 - $0) {
            swap(&nums, $0, length - kMax - 1 - $0)
        }
        
        if (length - kMax + $0) < (length - 1 - $0) {
            swap(&nums, length - kMax + $0, length - 1 - $0)
        }
           
        if $0 < (length - 1 - $0) {
            swap(&nums, $0, length - 1 - $0)
        }  
    }
}

func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}


/* 

    For example: Input Array we have is  [1, 2, 3, 4, 5, 6, 7, 8]

    Consider k is 3, so our final expected array is  [6, 7, 8 1, 2, 3, 4, 5]

    First we divide our main array into two halves... 

     1. [1, 2, 3, 4, 5] and [6, 7, 8]

    Now for both arrays, do swapping of first and last element to get the reversed arrays :

     2. [1, 2, 3, 4, 5] -> [5, 2, 3, 4, 1] -> [5, 4, 3, 2, 1]
    AND
     3. [6, 7, 8]  ->  [8, 7, 6]

    Now combine to arrays: 

     4. [5, 4, 3, 2, 1 , 8, 7, 6]

    Now for the main array, we can do swapping for reversal as well:

     5. [6, 7, 8, 1, 2, 3, 4, 5]

    Our array is sorted, but here's the catch.

    We can do all steps in one iteration.

    For this array: [1, 2, 3, 4, 5, 6, 7, 8]
    If we swap 
    1 with 5 (small left array), and 6 with 8 (small right array). And once that is done, we swap 5 with 6 (main array), we get
    [6, 2, 3, 4, 1, 8, 7 , 5]

    Next, we swap
    2 with 4 (small left), and 7 is in the center of next smaller division, so nothing to swap there besides at 2nd index of main array,
    After that we swap 7 with 4 we get
    [6, 7, 3, 2, 1, 8, 4, 5]

    Again, nothing to swap in our first and array since, only once digit left, so we again make swap at 3rd index of main array
    [6, 7, 8, 2, 1, 3, 4, 5]

    Now, final index to swap is at 4th of main array
    [6, 7, 8, 1, 2, 3, 4, 5]


*/
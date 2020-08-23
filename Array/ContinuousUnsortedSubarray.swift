/*

Leetcode: 581. Shortest Unsorted Continuous Subarray


Given an integer array, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order, too.

You need to find the shortest such subarray and output its length.

Example 1:

Input: [2, 6, 4, 8, 10, 9, 15]
Output: 5
Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.
Note:

Then length of the input array is in range [1, 10,000].
The input array may contain duplicates, so ascending order here means <=.


*/



func findUnsortedSubarray(_ nums: [Int]) -> Int { // Return the length of shortest continuous subarray that needs to be sorted to make entire array sorted.
        
        /* Nothing to sort, array is either empty or single digit */
        if nums.isEmpty || nums.count == 1 {
            return 0
        }
        
        /* We will create 2 local variables */
        /// S is the smallest number that is in an unsorted position.
        /// L is the largest number that is in an unsorted position
        var S: Int? = nil
        var L: Int? = nil
        

        // Loop through the array, 
        // for each number from beginning to the second last number

        /// Basically, iterate through each number and compare it with the 
        /// number to its right (pair wise check)
        for n in 0...(nums.count - 2) {
            
            if nums[n + 1] < nums[n] {   // If a pair is unsorted, that's where we know the problem lies 
                                                //(Problem is that nums[n + 1] < nums[n], an unsorted pair where right number is smaller that left number
                if S == nil {S = nums[n + 1]}
                if L == nil {L = nums[n]; continue} // Initialize both numbers and exit from this 'iteration'
                
                S = min(S!, nums[n + 1]) // Now check the minimum and set S if this unsorted pair has smaller unsorted number
                L = max(L!, nums[n])     // Also check if the larger number (nums[n]) is larger than current largest unsorted number
            }    
        }
        
        if S == nil || L == nil {
            return 0 // No pair found that wasnt sorted. Array is sorted.
        }
        
        // S needs to be at the left most sorted point in array (sorted from left)
        // L needs to be at the right most sorted point in array (sorted from right) 
        var positionConfirmed: (low: Bool, high: Bool) = (false, false)  
        var counter = 0
        
        while positionConfirmed != (true, true) && counter < nums.count {
            
            if S! < nums[counter] && !positionConfirmed.low {
                S = counter  /// Compare each element from left with S, then once found confirm this position and do not need to check again
                positionConfirmed.low = true
            }
            
            if L! > nums[nums.count - 1 - counter] && !positionConfirmed.high {
                L = nums.count - 1 - counter  /// Compare each element from right with L.
                positionConfirmed.high = true
            }
            
            counter += 1
        }
        
        return L! - S! + 1
        
    }


    /// Complexity -> O(n)
    /// One iteration with for loop -> O(n)
    /// Worst case for one while loop -> O(n)
    /// O(n + n) -> O(n)
 
    /* Future Scope 

        This algorithm works and provides us with a solution that is O(n)
        But instead of two horizontal iterations, we must look forward to optimizing this further to solve this within just one iteration.

    */
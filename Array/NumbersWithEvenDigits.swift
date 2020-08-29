/*

Leetcode: 1295. Find Numbers with Even Number of Digits

Given an array nums of integers, return how many of them contain an even number of digits.
 

Example 1:

Input: nums = [12,345,2,6,7896]
Output: 2
Explanation: 
12 contains 2 digits (even number of digits). 
345 contains 3 digits (odd number of digits). 
2 contains 1 digit (odd number of digits). 
6 contains 1 digit (odd number of digits). 
7896 contains 4 digits (even number of digits). 
Therefore only 12 and 7896 contain an even number of digits.
Example 2:

Input: nums = [555,901,482,1771]
Output: 1 
Explanation: 
Only 1771 contains an even number of digits.
 

Constraints:

1 <= nums.length <= 500
1 <= nums[i] <= 10^5

*/


func findNumbers(_ nums: [Int]) -> Int {
    
    var numbersWithEvenDigits = 0
    
    nums.forEach {                               // O(n)
        
        var thisNumber = $0
        var numberOfDigits = 0
        
        while thisNumber > 0 {   //   Business logic, statements take Linear time : O(1)
            numberOfDigits += 1                         ///    Business Logic to                        
            thisNumber -= (thisNumber % 10)             ///    check the number of
            thisNumber /= 10                            ///    digits in a number
        }
         
        if numberOfDigits % 2 == 0 {numbersWithEvenDigits += 1}     // Check if a number is even based on number of digits it has
        
    }
    
    return numbersWithEvenDigits 
}

/*

    Complexity: O(n)

*/


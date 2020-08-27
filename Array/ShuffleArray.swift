/*

Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

Return the array in the form [x1,y1,x2,y2,...,xn,yn].

 

Example 1:

Input: nums = [2,5,1,3,4,7], n = 3
Output: [2,3,5,4,1,7] 
Explanation: Since x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 then the answer is [2,3,5,4,1,7].
Example 2:

Input: nums = [1,2,3,4,4,3,2,1], n = 4
Output: [1,4,2,3,3,2,4,1]
Example 3:

Input: nums = [1,1,2,2], n = 2
Output: [1,2,1,2]
 

Constraints:

1 <= n <= 500
nums.length == 2n
1 <= nums[i] <= 10^3


*/

// Solution 1


func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    
    var array: [Int] = []
    
    (0..<n).forEach { 
        array.append(nums[$0])
        array.append(nums[$0 + n])
    }
    
    return array
    
}

/*

    Time Complexity: O(n)
    Space Complexity: O(n)

*/

// Solution 2

/*

    Explanation inspired from https://leetcode.com/problems/shuffle-the-array/discuss/675956/In-Place-O(n)-Time-O(1)-Space-With-Explanation-and-Analysis

*/

func shuffle(_ array: inout [Int], _ n: Int) -> [Int] {

    // left shift and right shift of 10 was chosen because number in algo has been constrained to 10^3 which means
    // this can be maximum of 1000 and that also means under 1024 decimal number and can be represented with 10 bits.
    
    (0..<n).forEach {
        let rightNumber = (array[$0] << 10) | array[$0 + n]     // 10 bit left movement for number 1 and bitwise addition of 2nd
        array[$0 + n] = rightNumber // store both numbers in 2nd part of array through bitwise representation
    }


    // Suppose only 4 bits are allowed..


    // Storing 9 and 12 in bit representation
    /// 12 -> 1100 << 4 -> 11000000           12 is 1100 in bits. Left shift it by 4 to get 11000000
    /// 9  | 11000000 -> 11001001             now perform bitwise OR with 9 (1001) to get   11001001

    // Now, 12 and 9 are inside 11001001  1100 (12)  1001 (9)

    // To get them back:

    /// 11001001 & 00001111 -> 00001001    -> 9    To get 9 back from 11001001, perform bitwise and with 1111 -> 11001001 & 00001111 -> 00001001 -> 9
    /// 11001001 >> 4 -> 1100              -> 12   To get 12 back from 11001001, right shift it back by 4 ... 11001001 >> 4 -> 00001100 -> 12

    var i = 0
    
    (n..<(2 * n)).forEach {
        array[i] = (array[$0]) >> 10        // Get number on left with right shift
        array[i + 1] = array[$0] & 1023     // Get number of right with nullifying left number and getting only right digit
        i += 2                              
    }
    
    return array
}

/*

    Time Complexity: O(n)
    Space Complexity: O(1)

*/
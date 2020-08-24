/*

Leetcode: 7. Reverse Integer

Given a 32-bit signed integer, reverse digits of an integer.

Example 1:

Input: 123
Output: 321
Example 2:

Input: -123
Output: -321
Example 3:

Input: 120
Output: 21
Note:
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

*/

func reverse(_ x: Int) -> Int {
    
    var numberToReverse = x > 0 ? x : x * -1
    var reversedNumber: Double = 0
    var overflow = false
    
    while numberToReverse > 0 && !overflow { /// 1234
        let lastDigit = removeAndGetLastDigit(&numberToReverse)  /// 123 
        overflow = appendNextDigit(&reversedNumber, digit: lastDigit) /// 4
    }
    
    if overflow {return 0}
    return x > 0 ? Int(reversedNumber) : -Int(reversedNumber)
    
}

func removeAndGetLastDigit(_ num: inout Int) -> Int {
    let remainder = num % 10                /// 1234 % 10 = 4
    num -= remainder                        /// 1234 - 4 = 1230
    num /= 10                               /// 1230 / 10 = 123
    return remainder                        // 4
}

func appendNextDigit(_ num: inout Double, digit: Int) -> Bool {
    num *= 10                               /// 0 * 10 = 0
    num += Double(digit)                    /// 0 + 4 = 4
     
    if num < Double(Int32.max) && num > Double(Int32.min) { // Integer overflow check
        return false
    } else {
        return true
    }
}
/*

    Main function is reverse()
    removeAndGetLastDigit removes last digit from an integer 
    and then it appends this integer to new integer using appenNextDigit function

    1234 -> 123 4 -> 12 34 -> 1 234 -> 0 1234

*/
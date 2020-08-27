/*

Leetcode: 859. Buddy Strings

Given two strings A and B of lowercase letters, return true if and only if we can swap two letters in A so that the result equals B.

 

Example 1:

Input: A = "ab", B = "ba"
Output: true
Example 2:

Input: A = "ab", B = "ab"
Output: false
Example 3:

Input: A = "aa", B = "aa"
Output: true
Example 4:

Input: A = "aaaaaaabc", B = "aaaaaaacb"
Output: true
Example 5:

Input: A = "", B = "aa"
Output: false
 

Constraints:

0 <= A.length <= 20000
0 <= B.length <= 20000
A and B consist only of lowercase letters.


*/


func buddyStrings(_ A: String, _ B: String) -> Bool {
        
    if A.count != B.count {return false}
    
    var result: Bool = false
    
    if A == B {                                 // If two strings are equal
        var repeatChars = [Character]()         // Then check if any character is repeated in string
        
        outer: for value in (0..<A.count) {
            
            let aValue = A[A.index(A.startIndex, offsetBy: value)]
            
            if repeatChars.contains(aValue) {
                result = true                       // If so, then that means that this condition is true and 
                break outer                         // A and B are buddies
            } else {                                // For example, aaac and aaac are buddies because with at most one change
                repeatChars.append(aValue)          // will keep the strings same. i.e. if a and a is swapped in A or B
            }
        }
        
    } else { /// If A and B are not equal
        
        var repeatChars: (Character, Character)?
        
        outer: for value in (0..<A.count) {         // Loop through each character index and check the index where two strings are not equal
              
            let aValue = A[A.index(A.startIndex, offsetBy: value)]
            let bValue = B[B.index(B.startIndex, offsetBy: value)]
            
            if aValue != bValue {       /// Found a point where Character in 'A' is not equal to that in 'B'
                if repeatChars == nil {
                    repeatChars = (aValue, bValue)    // This is the first time we have found an inequality, save this in a tuple
                } else {
                    result = (repeatChars!.0 ==  bValue) && (repeatChars!.1 == aValue) // This is the second time we have found an inequality, compare if point of inequality equals to what we have stored in tuple before
                    if !result {break outer}     // If the two points are inequal, it means that at least a single swap won't make them equal.
                }
            }
        }
        
    }
    
    return result
}


/*

    Solution: https://leetcode.com/problems/buddy-strings/solution/

*/
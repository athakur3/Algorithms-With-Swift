/**

Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

**/

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        
        if s.isEmpty {
            return true
        }
        
        var smallArray = Array(s)
        var superArray = Array(t)
        
        var matchedIndex = 0
        var finalIndex = smallArray.count
        var returnValue = false
        var counter = 0
        
        while !returnValue && counter < superArray.count {
            if superArray[counter] == smallArray[matchedIndex] {
                matchedIndex = matchedIndex + 1
                if matchedIndex == finalIndex {
                    returnValue = true
                }
            } 
            counter = counter + 1
        }
        
        return returnValue
        
    }
}

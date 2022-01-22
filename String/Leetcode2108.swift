/*

2108. Find First Palindromic String in the Array
  
Given an array of strings words, return the first palindromic string in the array. If there is no such string, return an empty string "".

A string is palindromic if it reads the same forward and backward.

*/


class Solution {
    func firstPalindrome(_ words: [String]) -> String {
        var counter = 0
        while counter < words.count {
            if words[counter].isPalindromic() {
                return words[counter]
            }
            counter = counter + 1
        }
        
        return ""
    }
}

extension String {
    func isPalindromic() -> Bool {
        var sIndex = startIndex
        var eIndex = index(endIndex, offsetBy: -1)
        while sIndex < eIndex {
            if self[sIndex] != self[eIndex] {
                return false
            }
            sIndex = index(after: sIndex)
            eIndex = index(before: eIndex)
        }
        
        return true
    }
}

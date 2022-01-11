/*

1528. Shuffle String
Leetcode: 
You are given a string s and an integer array indices of the same length. The string s will be shuffled such that the character at the ith position moves to indices[i] in the shuffled string.

Return the shuffled string.

*/

class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        
        var hashmap = [Int: Character]()
        
        (0..<indices.count).forEach { hashmap[indices[$0]] = s[s.index(s.startIndex, offsetBy: $0)] }               
        var string = ""
        
        (0..<indices.count).forEach { value in
            string = string + String(hashmap[value]!)
        }
        
        return string
        
    }
}

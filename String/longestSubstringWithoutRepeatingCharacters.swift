// Leetcode Problem 3. Longest Substring Without Repeating Characters

/*
  Given a string s, find the length of the longest substring without repeating characters.
*/

// simplere version

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var window = [Character]()
        var length:Int = 0
        
        for i in s {
            if window.isEmpty{
                window.append(i)
            }else{
                if window.contains(i) {
                    if length < window.count {
                        length = window.count
                    }
                    
                   while window.contains(i) {
                       window.remove(at:0)
                   } 
                }
                
                window.append(i)
            }
        }
        
        return max(length,window.count)
    }
}

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var stringArray = Array(s)
        var rightPosition = 0
        var leftPosition = 0
        var hashMap = [Character: Int]()
        var longestLength = 0
        
        (0..<stringArray.count).forEach { value in
            rightPosition = rightPosition + 1
                                         
            let char = stringArray[value]
                                         
            if hashMap[char] != nil {
                let charIndex = hashMap[char]!
                if leftPosition < charIndex + 1 {
                    leftPosition = charIndex + 1
                }   
            } 
                                         
            hashMap[char] = value
                                         
            longestLength = max((rightPosition - leftPosition), longestLength)
        }
        
        return longestLength
        
    }
}

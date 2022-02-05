/*

Given an integer array nums and an integer k, return the number of pairs (i, j) where i < j such that |nums[i] - nums[j]| == k.

The value of |x| is defined as:

x if x >= 0.
-x if x < 0.
 

*/

func countKDifference(_ nums: [Int], _ k: Int) -> Int {
        
        var counter = 0
        
        var hashmap = [Int: Int]()
        
        for index in (0..<nums.count) {
            let item = nums[index]
            let absOne = item - k
            let absTwo = k + item
            
            if hashmap[absOne] == nil {
                hashmap[absOne] = 1
            } else {
                hashmap[absOne] = hashmap[absOne]! + 1
            }
            
            if hashmap[absTwo] == nil {
                hashmap[absTwo] = 1
            } else {
                hashmap[absTwo] = hashmap[absTwo]! + 1
            }
            
            if hashmap[item] != nil {
                counter = counter + hashmap[item]!
            }
        }
        return counter
}

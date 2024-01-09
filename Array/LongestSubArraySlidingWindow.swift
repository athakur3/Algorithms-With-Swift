//
//  LongestSubArraySlidingWindow.swift
//  
//
//  Created by Tarun Kaushik on 19/10/21.
//

func findLongestSubArrayUsingSlidingWindow(array:[Int],s: Int) -> [Int] {
    var window = [Int]()
    var arraySum = 0
    var largestArray = [Int]()
    
    for i in array {
        // update the array sum and append on window
        arraySum += i
        window.append(i)
        
        // check if the arraysum become more than the required sum
        if arraySum > s {
            // if yes than remove the first element from the window till the array sum is greater than required sum
            while arraySum > s {
                let firstElement = window[0]
                arraySum -= firstElement
                window.removeFirst()
            }
        }
        
        // check if sum is equal than update the largest array
        if arraySum == s {
            if largestArray.count < window.count {
                largestArray = window
            }
        }
    }
    
    return largestArray
}

print(findLongestSubArrayUsingSlidingWindow(array: [1,2,4,3,0,0,0,0,10], s: 10))


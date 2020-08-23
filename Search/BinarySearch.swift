//
//  BinarySearch.swift
//  Binary Search Algorithm
//
//  Created by Akshansh Thakur on 21/08/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

var data: [Int] {
    var array: [Int] = []
    
    Array(0...600).forEach({ (value) in
        array.append(Int.random(in: 0..<4000))
    })
    
    array.sort()
    
    return array
}

func BinarySearch(_ array: [Int], target: Int) -> Bool {
    
    guard !array.isEmpty else {return  false}
    guard target >= array[0] else {return  false}
    guard target <= array[array.count - 1] else {return  false}
    
    let minIndex = 0
    let middleIndex = array.count / 2
    let maxIndex = array.count - 1
    let middleValue = array[middleIndex]
    
    if target > middleValue {
        return BinarySearch(Array(array[(middleIndex + 1)...maxIndex]), target: target)
    }
    
    if target < middleValue {
        return BinarySearch(Array(array[(minIndex..<(middleIndex))]), target: target)
    }
    
    if target == middleValue {
        return true
    }
    
    return false
}

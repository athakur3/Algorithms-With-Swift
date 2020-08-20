//
//  TwoSumProblem.swift
//  Algorithms With Swift
//
//  Created by Akshansh Thakur on 21/08/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

var data: [Int] {
    var array: [Int] = []
    
    Array(0...500).forEach({ (value) in
        array.append(Int.random(in: 0..<4000))
    })
    
    array.sort()
    
    return array
}

func checkTwoSum(array: [Int], sum: Int) -> (Bool, Int?, Int?) {
    
    var i = 0
    var j = array.count - 1
    
    while j > i {
        switch array[i] + array[j] {
        case (sum + 1)..<Int.max:
            j -= 1
        case Int.min..<sum:
            i += 1
        case sum:
            return (true, array[i], array[j])
        default:
            return (false, nil, nil)
        }
    }
    return (false, nil, nil)
}

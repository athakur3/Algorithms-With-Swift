//
//  ReverseArray.swift
//  Algorithms With Swift
//
//  Created by Akshansh Thakur on 21/08/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation

func reverseArray(_ array: inout [Int]) {
    
    var i = 0
    var j = array.count - 1
    
    while j > i {
        let temp = array[i]
        array[i] = array[j]
        array[j] = temp
        i += 1; j -= 1
    }
    
}

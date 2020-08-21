//
//  DataSourceArray.swift
//  Algorithms With Swift
//
//  Created by Akshansh Thakur on 21/08/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation

var data: [Int] {
    var array: [Int] = []
    
    Array(0...500).forEach({ (value) in
        array.append(Int.random(in: 0..<4000))
    })
    
    array.sort()
    
    return array
}

var array: ((Bool, _ maxValue: Int, _ numberOfDigits: Int) -> [Int]) = { sorted, maxValue, numberOfDigits in
     var array: [Int] = []
     
     Array(0...numberOfDigits).forEach({ (value) in
         array.append(Int.random(in: 0..<maxValue))
     })
    
    if sorted {
        return array.sorted()
    } else {
        return array
    }
    
}

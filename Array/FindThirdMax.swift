import Foundation


func FindThirdMaximum(array: [Int]) -> Int {
    
    var max1: Int?
    var max2: Int?
    var max3: Int?
    
    for value in array {
        
        if max1 == nil {
            max1 = value
        } else if max2 == nil && max1 != value {
            if value > max1! {
                max2 = max1!
                max1 = value
            } else {
                max2 = value
            }
        } else if max3 == nil && max1 != value && max2 != value {
            if value > max1! {
                max3 = max2!
                max2 = max1!
                max1 = value
            } else if value > max2! {
                max3 = max2!
                max2 = value
            } else {
                max3 = value
            }
        } else if value > max1! {
            max3 = max2
            max2 = max1
            max1 = value
        } else if max2 != nil && value > max2! && max1 != value {
            max3 = max2
            max2 = value
        } else if max3 != nil && value > max3! && max1 != value && max2 != value {
            max3 = value
        }
    }
    
    if max3 == nil {return max1!}
    if max2 == nil {return max1!}
    
    return max3!
}
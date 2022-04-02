// Binary Search
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

// Returns index of the search value else return -1
func binarySearch(_ nums:[Int],_ target:Int,_ startIndex:Int,_ endIndex:Int) -> Int{
     if startIndex > endIndex  {
        return -1
     }
        
     let mid = startIndex + (endIndex - startIndex)/2
     let midValue = nums[mid]
        
     if midValue == target {
         return mid
     }else if target > midValue{
         return binarySearch(nums,target,mid+1,endIndex)
     }else if target < midValue{
         return binarySearch(nums,target,startIndex,mid - 1)
     }
        
     return -1
}

// Binary Search Using loop
func search(_ nums: [Int], _ target: Int) -> Int {
    var startIndex: Int = 0
    var endIndex: Int = nums.count - 1
        
    while(startIndex <= endIndex){
        let mid = startIndex + (endIndex - startIndex)/2
        let midValue = nums[mid]
        if midValue == target{
            return mid
        }else if target > midValue{
            startIndex = mid + 1 
        }else{
            endIndex = mid - 1
        }
    }
        
    return -1
}

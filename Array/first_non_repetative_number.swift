// ++++++++++++++++++++++++++++++++++++++++++ first non repeating number in array -> Initial approach ++++++++++++++++++++++++++++++++++++++++++++++++++

func nonRepNumber(array:[Int]){
    var uniqueArray = [Int]()
    var dic:[Int:Int] = [:]
    
    for i in array.indices{
        if dic[array[i]] == nil {
            uniqueArray.append(i)
            dic[array[i]] = uniqueArray.count - 1
        }else{
            if let index = dic[array[i]]{
                uniqueArray.remove(at: index)
            }
        }
    }
    
    print("first non repeating number is at \(uniqueArray[0]) and it is \(array[uniqueArray[0]])")
}


nonRepNumber(array: [1,2,70,1,70,23,6,232,5,6,78,0])

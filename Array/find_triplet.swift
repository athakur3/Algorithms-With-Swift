// ++++++++++++++++++++++++++++++++ find if triplet exists ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


func tripletExist(array:[Int],num:Int) -> Bool{
    
    for (index,i) in array.enumerated(){
        let sum = num - i
        var table:[Int:Int] = [:]
        for k in index...(array.count - 1){
            let j = array[k]
            if index != k{
            if table[j] != nil{
                print("\(i),\(j),\(sum - j)")
                return true
            }else{
                table[sum-j] = sum - j
                }
            }
        }
    }
    return false
}


print(tripletExist(array: [1,4,45,8,7,0,1], num: 15))

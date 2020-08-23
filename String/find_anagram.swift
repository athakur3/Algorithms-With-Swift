/* +++++++++++++++++++++++++++++++++++++++++++++++++++ find anagram ++++++++++++++++++++++++++++++++++++++++++*/

// anagram :- anagrams are two string which have same characters but arranged diffrently example Tarun and nurat

func checkAnagram(string1:String,string2:String) -> Bool{
    var charSet1:[Character:Int] = [:]
    var charSet2:[Character:Int] = [:]
    
    if string1.count != string2.count{
        return false
    }
    
    if string1 == string2{
        return true
    }
    
    for char in string1{
        if let value = charSet1[char] {
            charSet1[char] = 1 + value
        }else{
            charSet1[char] = 1
        }
    }
    
    for char in string2{
        if let value = charSet2[char] {
            charSet2[char] = 1 + value
        }else{
            charSet2[char] = 1
        }
    }
    
    return charSet1 == charSet2
}

print(checkAnagram(string1: "geeksforgeeks", string2: "forgeeksgeeks"))

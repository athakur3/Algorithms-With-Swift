/* +++++++++++++++++++++++++++++++++++++++++++++++++++ return unique string from given string ++++++++++++++++++++++++++++++++++++++++++*/

func uniqueString(string:String)-> String{
    var charSet:[Character:Bool] = [:]
    var uniqueString = ""
    
    for char in string{
        if charSet[char] == nil {
            uniqueString += "\(char)"
            charSet[char] = true
        }
    }
    
    return uniqueString
}

print(uniqueString(string: "aksnfaksnasaknafafonjkbuiergweiuhoaincbyryqowrpjqpfjvbzhbisdueonaciabviuthonq"))

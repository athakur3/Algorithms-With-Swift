/* +++++++++++++++++++++++++++++++++++++++++++++++++++ uniqueness of string ++++++++++++++++++++++++++++++++++++++++++*/

// finding if the array is unique
func findUniqueNess(string:String) -> Bool{
    var charSet:[Character:Bool] = [:]
    for val in string{
        guard charSet[val] == nil else{return false}
        charSet[val] = true
    }
    return true
}
print("\nUNIQUNESS")
findUniqueNess(string: "asdfghjkl")

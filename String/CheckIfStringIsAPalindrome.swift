Check if a string is a palindrome

func solution(inputString: String) -> Bool {

    let inputStringArray = Array(inputString)
    
    var startIndex = 0
    var endIndex = inputStringArray.count - 1
    
    while startIndex < endIndex {
        guard inputStringArray[startIndex] == inputStringArray[endIndex] else {
            return false
        }
        startIndex = startIndex + 1
        endIndex = endIndex - 1
    }
    
    return true

}

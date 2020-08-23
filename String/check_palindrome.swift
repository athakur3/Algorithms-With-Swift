/* +++++++++++++++++++++++++++++++++++++++++++++++++++ check palindrome ++++++++++++++++++++++++++++++++++++++++++*/

// to find if a string is a palindrome or not
func findPalindrome(string:String){
    
    if string.first != string.last{
        print("Not a palindrome and i am returning from Here")
        return
    }
    
    let reverseString = findReverseOfString(string: string)
    
    if reverseString == string{
        print("Its a palindrome")
    }else{
        print("Not a palindrome")
    }
}

print("\npalindrom")
findPalindrome(string: "madam")


func reverseNumber(num:Int){
    var num = num
    var reverseNum = 0
    
    while num != 0 {
        reverseNum = reverseNum * 10 + num%10
        num = num/10
    }
    
    print(reverseNum)
}

reverseNumber(num: 98123124)

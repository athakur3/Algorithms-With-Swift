/* ++++++++++++++++++++++++++++++++++++++++++++++++++++Balance Paranthesis problem *********************************/

/* Algorithm
 1. Loop through string.
 2. Compare if next character in the string is "(","{","["
 3. If Yes => push to stack
 4. If No => check weather the character is ")","}","]"
 5. If Yes => check last element on the stack i.e it should be "(" for ")" respectivly
 6. If Yes => pop the element and repeat steps 2,3,4,5
 7. If No => return false i.e parantheses not balanced
 8. Check if stack is empty 
 9. If empty return True (balanced) else false(unbalanced).
*/

func isPranathesesBalanced(str:String) -> Bool{
    var stack = [Character]()
    
    for char in str{
        // check if char is on type (,{,]
        if ["(","{","["].contains(char){
            // add the char to stack
            stack.append(char)
        }else{
            // check if the stack is empty than return false
            if stack.isEmpty {return false}
            
            // check if last element of stack is not { for char } and return false
            if (char == "}") && (stack.last! != "{") {return false}
            
            // check if last elemet of stack is not ( for char ) and return false
            if (char == ")") && (stack.last! != "(") { return false}
            
            // check if last element of stack is not [ for char ] and return false
            if (char == "]") && (stack.last! != "["){return false}
            
            // if all false conditions are not passed than pop the last element
            stack.popLast()
        }
    }
    
    // Return if the given stack is empty or not. -> if empty than balanced if not empty than unbalanced
    return stack.isEmpty
}

print(isPranathesesBalanced(str: "[({})]"))


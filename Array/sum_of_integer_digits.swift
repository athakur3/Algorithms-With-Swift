/* +++++++++++++++++++++++++++++++++++++++++++++++++++ Find sum of digits ++++++++++++++++++++++++++++++++++++++++++
  Problem
  WAP to find the sum of an integer digits
  
  example
  input:99882
  output: 36
  
  Explanation:
  digits are: 9,9,8,8,2
  sum of digits are: 9+9+8+8+2 = 36
  
  Algo:
    1. find the remainder using % operator => (remainder = number % 10)
    2. add on the sum => (sum = sum + remainder)
    2. update the exisiting number => updated (number = number / 10)
  
*/

func findSumOfDigit(num:Int){
    var sum = 0
    var number = num
    
    while(number != 0 ){
        sum += number % 10
        number = number/10
    }
    
    print("The sum of all digits of \(num) is \(sum)")
}

print("\nSum of digits")
findSumOfDigit(num: 9231310)

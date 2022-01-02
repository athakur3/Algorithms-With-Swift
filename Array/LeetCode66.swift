class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        if digits[digits.count - 1] == 9 {
            
            var array = [Int]()
            var carry = 1
            (0...(digits.count - 1)).forEach { value in
                let sum = digits[(digits.count - 1) - value] + carry
                carry = (sum == 10) ? 1 : 0
                array.insert(sum % 10, at: 0)
            }
            
            if carry == 1  {
                array.insert(1, at: 0)
            }
            
            return array
            
        } else {
            var digitsArray = digits 
            digitsArray[digits.count - 1] += 1
            
            return digitsArray
        }
         
        return []
    }
}

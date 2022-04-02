// Fibonacci
class Solution {
    var cache = [Int:Int]()
    func fib(_ n: Int) -> Int {
        // base condition
        if n <= 1 {
            return n 
        }
        
        if let value = cache[n]{
            return value   
        }else{
            let value = fib(n-1) + fib(n-2)
            cache[n] = value
            return value
        }
        
    }
}

// Tribonacci
class Solution {
    var cache:[Int:Int] = [:]
    func tribonacci(_ n: Int) -> Int {
        if n <= 1 {
            return max(0,n)
        }
        if let value = cache[n]{
            return value
        }else{
            let value = tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
            cache[n] = value
            return value
        }
    }
}

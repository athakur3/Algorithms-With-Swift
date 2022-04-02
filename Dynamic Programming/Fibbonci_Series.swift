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
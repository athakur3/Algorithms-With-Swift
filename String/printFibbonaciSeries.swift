import Foundation

func printFib(_ n: Int){
  for i in 0 ..< n {
    print(fib(i))
  }
}

func fib(_ n: Int) -> Int {
  if n == 0 {return 0}
  else if n == 1 {return 1}
  return fib(n-1) + fib(n-2)
}

printFib(6)

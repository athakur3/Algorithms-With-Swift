func tribonacci(_ n: Int) -> Int {
  if n <= 1 {
    return max(0,n)
  }
  return tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
}

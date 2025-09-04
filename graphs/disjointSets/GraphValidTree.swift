// You have a graph of n nodes labeled from 0 to n - 1. 
// You are given an integer n and a list of edges where edges[i] = [ai, bi] 
// indicates that there is an undirected edge between nodes ai and bi in the graph.
// Return true if the edges of the given graph make up a valid tree, and false otherwise.

// https://leetcode.com/explore/learn/card/graph/618/disjoint-set/3910/


class DisjointSets {
    private var parent:[Int]
    private var rank:[Int]
    private(set) var count:Int
    
    init(_ size:Int) {
        self.parent = Array(0 ..< size)
        self.rank = Array(repeating:0, count: size)
        self.count = size
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) -> Bool {
      let parentX = find(x)
      let parentY = find(y)
        
      if parentX != parentY {
          if rank[parentX] > rank[parentY] {
              parent[parentY] = parentX
          } else if rank[parentX] < rank[parentY] {
              parent[parentX] = parentY
          } else {
              parent[parentY] = parentX
              rank[parentX] += 1
          }
          count -= 1
          return true
      }
        return false
    }
    
}


class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        let ds = DisjointSets(n)
        for row in edges {
           if ds.union(row[0],row[1]) == false {
               return false
           }
        }
        
        return ds.count == 1
    }
}

// https://leetcode.com/explore/learn/card/graph/618/disjoint-set/3845/
// Number of Provinces
// There are n cities. Some of them are connected, while some are not. 
// If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.
// A province is a group of directly or indirectly connected cities and no other cities outside of the group.
// You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.
// Return the total number of provinces.

// Example 1:
// Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
// Output: 2

// Example 2:
// Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
// Output: 3
 

// Constraints: 

// 1 <= n <= 200
// n == isConnected.length
// n == isConnected[i].length
// isConnected[i][j] is 1 or 0.
// isConnected[i][i] == 1
// isConnected[i][j] == isConnected[j][i]



class DisjointSet{
    private var root:[Int]
    private var rank:[Int]
    private var count: Int
    
    init(_ size: Int ) {
        root = Array(0..<size)
        rank = Array(repeating:0, count: size)
        count = size
    }
    
    func find(_ x: Int) -> Int {
        if root[x] != x {
          root[x]  = find(root[x])  
        }
        return root[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        guard rootX != rootY else {
            // perform no operation and return
            return
        }
        
        if rank[rootX] < rank[rootY] {
            root[rootX] = rootY
        } else if rank[rootX] > rank[rootY] {
            root[rootY] = rootX
        } else {
            root[rootY] = rootX
            rank[rootX] += 1
        }
        count -= 1
         // since number of provices are cities which do not union.so we reduce each city after union
    }
    
    func getCount() -> Int {
        return count
    }
}

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        guard isConnected.count > 0 else {return 0}
        let ds = DisjointSet(isConnected.count)
        for row in 0 ..< isConnected.count - 1 {
            for col in row + 1 ..< isConnected.count {
                if isConnected[row][col] == 1 {
                    ds.union(row,col)
                }
            }
        }
        return ds.getCount()
    }
}

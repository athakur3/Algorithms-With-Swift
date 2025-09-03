// Disjoint set

class DisjointSet {
    private var parent:[Int]
    private var rank:[Int]
    
    init(_ size: Int) {
        self.parent = Array(0..<size)
        self.rank = Array(repeating: 0, count: size)
    }
    
    func find(_ x: Int) -> Int  {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX != rootY {
            if rank[rootX] > rank[rootY] {
                parent[rootY] = rootX
            } else if rank[rootX] < rank[rootY] {
                parent[rootX] = rootY
            } else {
                parent[rootY] = rootX
                rank[rootX] += 1
            }
        }
    }
    
    func printParents(_ x: Int) -> String {
        var str = "\(x)"
        if parent[x] != x {
            let root = printParents(parent[x])
            str = "\(x) -> \(root)"
        } else {
            str = "\(x)(Root)"
        }
        return str
    }
}

let ds = DisjointSet(10)
ds.union(0, 1)
ds.union(2, 3)
ds.union(4, 5)
ds.union(6, 7)
ds.union(8, 9)

ds.union(0, 2)
ds.union(4, 6)
ds.union(8, 0)

print(ds.find(8))
print(ds.printParents(7))
// 7 -> 6 -> 4(Root)

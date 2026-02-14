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



let’s visualize how path compression flattens the tree in Disjoint Set, and why it leads to amortized O(1).

🔹 Step 1: Initial State

We have 6 elements:

0   1   2   3   4   5


Each is its own parent.

parent = [0, 1, 2, 3, 4, 5]

🔹 Step 2: Perform Unions

Let’s union them in a chain:

union(0, 1) → 1 → 0

union(1, 2) → 2 → 1 → 0

union(2, 3) → 3 → 2 → 1 → 0

union(3, 4) → 4 → 3 → 2 → 1 → 0

union(4, 5) → 5 → 4 → 3 → 2 → 1 → 0

Now the tree looks like a linked list (bad case):

5 → 4 → 3 → 2 → 1 → 0


find(5) would take O(n) = 6 steps here.

🔹 Step 3: Path Compression in Action

Call find(5):

It sees parent[5] = 4 (not root).

Recursively finds root → find(4), then find(3), … until root = 0.

While returning, it updates all parents along the path to point directly to root.

After this single find(5):

5 → 0
4 → 0
3 → 0
2 → 0
1 → 0
0 → 0

🔹 Step 4: Tree After Compression

Now the structure is:

   0
 / | | | | \
1  2 3 4  5


Depth = 1.

Next time we do find(5) (or any other node), it’s direct O(1).

🔹 Why is this Amortized?

The first find(5) was expensive (O(n)).

But it flattened the tree for everyone.

All future finds are cheap (O(1)).

Over many operations, the average cost is ~O(1), not O(n).

Formally, this averages to O(α(n)), where α(n) (inverse Ackermann) is ≤ 4 for all realistic n.

✅ That’s why we say Union-Find with path compression + rank has amortized O(1) operations.

👉 Do you also want me to show how union by rank avoids even creating that long chain in the first place (so path compression has less work to do)?

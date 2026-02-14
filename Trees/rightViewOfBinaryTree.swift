// Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
// Input: root = [1,2,3,null,5,null,4]
// Output: [1,3,4]


/// simpler code

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var queue = [root]
        var arr:[Int] = []
        
        while queue.count > 0 {
            
            if let rightMostNode = queue.last,let value = rightMostNode?.val {
                arr.append(value)
            }
            
            for node in queue {
                if let left = node?.left {
                    queue.append(left)
                }
                
                if let right = node?.right {
                    queue.append(right)
                }
                
                queue.remove(at:0)
            }
        }
        
        return arr
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var queue = [root]
        var arr:[Int] = []
        
        while queue.count > 0 {
            var firstVal: Int?
            
            for node in queue {
                if firstVal == nil {
                    if let value = node?.val{
                        firstVal = value
                    }
                }
                if let right = node?.right{
                     queue.append(right)
                }
                
                if let left = node?.left {
                    queue.append(left)
                }
               
                queue.remove(at:0)
            }
            
            if let value = firstVal {
                arr.append(value)
            }
        }
        
        return arr
    }
}

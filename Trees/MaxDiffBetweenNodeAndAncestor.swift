

// Leetcode- 1026

/*
Given the root of a binary tree, find the maximum value v for which there exist different nodes a and b where v = |a.val - b.val| and a is an ancestor of b.

A node a is an ancestor of b if either: any child of a is equal to b or any child of a is an ancestor of b.
*/


// Brute force approach 
class Solution {
    
    var absHighestValue = Int.min
    
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        
        var stack = [TreeNode]()
        
        guard let rootNode = root else {
            return 0
        }
        
        stack.append(rootNode)
        
        while !stack.isEmpty {
            let lastNode = stack.removeLast()
            absHighestValue = max(findAbsValueForANode(root: lastNode), absHighestValue)
            if let leftNode = lastNode.left {
                stack.append(leftNode)
            }
            if let rightNode = lastNode.right {
                stack.append(rightNode)
            }
        }
        
        return absHighestValue
        
    }
    
    func findAbsValueForANode(root: TreeNode?) -> Int {
        
        var stack = [TreeNode]()
        var lowestValue = Int.max
        var highestValue = Int.min
        
        guard let rootNode = root else {
            return 0
        }
        
        stack.append(rootNode)
        
        while !stack.isEmpty {
            let lastNode = stack.removeLast()
            lowestValue = min(lastNode.val, lowestValue)
            highestValue = max(lastNode.val, highestValue)
            if let leftNode = lastNode.left {
                stack.append(leftNode)
            }
            if let rightNode = lastNode.right {
                stack.append(rightNode)
            }            
        }
        
        let rootValue = rootNode.val
        
        let maxVal = max(abs(rootValue - highestValue), abs(rootValue - lowestValue))
        return maxVal
    }
    
}

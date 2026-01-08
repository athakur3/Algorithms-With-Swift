// 98. Validate Binary Search Tree
// https://leetcode.com/problems/validate-binary-search-tree/
// Share
// Given the root of a binary tree, determine if it is a valid binary search tree (BST).

// A valid BST is defined as follows:

// The left subtree of a node contains only nodes with keys less than the node's key.
// The right subtree of a node contains only nodes with keys greater than the node's key.
// Both the left and right subtrees must also be binary search trees.
 

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        let lowestVal = Int.min
        let hightVal = Int.max
        return isValid(root,lowestVal,hightVal)
    }
    
    func isValid(_ root: TreeNode?, _ left: Int, _ right: Int) -> Bool{
        guard let node = root else {return true}
        
        if node.val >= right || node.val <= left {
            return false
        }
        
        return isValid(node.left,left,node.val) && isValid(node.right, node.val, right)
    }
}

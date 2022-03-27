/*
Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
*/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        if (root === p) || (root === q){
            return root
        }
        
        let leftroot = lowestCommonAncestor(root!.left,p,q)
        let rightRoot = lowestCommonAncestor(root!.right,p,q)
        
        if leftroot != nil && rightRoot != nil {
            return root
        }
        
        if leftroot != nil {
            return leftroot
        }else {
            return rightRoot
        }
    }
}

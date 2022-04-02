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
        // check if the root is equal to p or q
        if (root === p) || (root === q){
            return root
        }
        // if not
        // get the root with values of p and q for left and right side.
        let leftroot = lowestCommonAncestor(root!.left,p,q)
        let rightRoot = lowestCommonAncestor(root!.right,p,q)
        
        // if both left and right root node presents i.e both p and q nodes are separated by current node and current node is the common ancestor
        if leftroot != nil && rightRoot != nil {
            return root
        }
        
        // if only left root exists that means q and p values are present on the one side and since left root value is found so other value must also be present under it
        // and hence the non nil root becomes the least ancestor
        if leftroot != nil {
            return leftroot
        }else {
            return rightRoot
        }
    }
}

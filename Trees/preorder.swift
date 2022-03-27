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

/*
for a binary try preorder treversal is defined as root,left,right
*/

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        // base condition
        if root  == nil {
            return []
        }
        
        var array:[Int] = [root!.val]
        let leftArray = preorderTraversal(root!.left)
        let rightArray = preorderTraversal(root!.right)
        array.append(contentsOf:leftArray)
        array.append(contentsOf:rightArray)
        
        return array
    }
}

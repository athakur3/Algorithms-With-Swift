// Binary Tree Paths

// Share
// Given the root of a binary tree, return all root-to-leaf paths in any order.

// A leaf is a node with no children.
// Example 1:
// Input: root = [1,2,3,null,5]
// Output: ["1->2->5","1->3"]
//            1                 ["1"]
//      2           3           ["1->2"],["1->3"]
//  4       5   6       7
// ["1->2->4","1->2->5","1->3->6","1->3->7"]
//
// Example 2:
// Input: root = [1]
// Output: ["1"]

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

//            1                 ["1"]
//      2           3           ["1->2"],["1->3"]
//  4       5   6       7

// ["1->2->4","1->2->5","1->3->6","1->3->7"]

class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let node = root else {return [""]}
        var paths:[String] = []
        getBinaryTreePaths(node,value:"",paths:&paths)
        return paths
    }
    
    func getBinaryTreePaths(_ root:TreeNode?,value:String,paths:inout [String]){
        guard let node = root else {return}
        
        var updatedString = ""
        if value.count == 0{
            updatedString = "\(node.val)"
        }else{
            updatedString = value + "->" + "\(node.val)"
        }
        
        if node.left == nil && node.right == nil{
            paths.append(updatedString)
            return
        }
        
        if let left = node.left {
            getBinaryTreePaths(left,value:updatedString,paths: &paths)
        }
        
        if let right = node.right {
            getBinaryTreePaths(right,value:updatedString,paths: &paths)
        }
    }
}

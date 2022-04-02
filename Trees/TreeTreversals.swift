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
    
    /* INORDER TREVERSAL (LRR)
        inorder treversal is defined as left, root , right
    */
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        // Base condition        
        guard let rootNode = root else {return []}
        
        let leftTraversal = inorderTraversal(rootNode.left)
        let root = rootNode.val
        let rightTraversal = inorderTraversal(rootNode.right)
        
        var array = leftTraversal
        array.append(root)
        array.append(contentsOf:rightTraversal)
        
        return array
    }
    
    /* PREORDER TREVERSAL (RLR)
        for a binary try preorder treversal is defined as root,left,right
    */
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        // Base condition
        guard let rootNode = root else {return []}
        
        let root = rootNode.val
        let leftArray = preorderTraversal(rootNode.left)
        let rightArray = preorderTraversal(rootNode.right)
        
        var array:[Int] = [root]
        array.append(contentsOf:leftArray)
        array.append(contentsOf:rightArray)
        
        return array
    }
    
    /* POSTORDER TREVERSAL (L,R,R)
        for a binary try postorder treversal is defined as left,right,root
    */
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        // Base condition
        guard let rootNode = root else {return []}
        
        let leftArray = postorderTraversal(rootNode.left)
        let rightArray = postorderTraversal(rootNode.right)
        let root = rootNode.val
                 
        var array = leftArray
        array.append(contentsOf:rightArray)
        array.append(root)
           
        return array
    }
    
    /*
    Level order traversal -> travers very level
    */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        let height = heightOfTree(root)
        
        var array:[[Int]] = []
        for i in 0 ..< height {
            let values = currentLevel(root,level:i)
            array.append(values)
        }
        
        return array
    }
    
    func currentLevel(_ root: TreeNode?,level: Int) -> [Int] {
        guard let node = root else {return []}
        
        if level == 0 {
            return [node.val]
        }
        
        let leftLevel = currentLevel(node.left,level:level - 1)
        let rightLevel = currentLevel(node.right,level:level - 1)
        
        var array = leftLevel
        array.append(contentsOf: rightLevel)
        
        return array
    }
    
    /*
    Height of tree
    */
    func heightOfTree(_ root: TreeNode?) -> Int {
        guard let node = root else {return 0}
        
        let leftHeight = heightOfTree(node.left)
        let rightHeight = heightOfTree(node.right)
        
        if leftHeight > rightHeight{
            return leftHeight + 1
        }else{ 
            return rightHeight + 1
        }
    }
}

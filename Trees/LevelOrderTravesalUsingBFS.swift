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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let rootNode = root else {return []}
      
        //1. Take one queue and append the first node 
        var queue = [rootNode]
        var result:[[Int]] = [[rootNode.val]]
        
       //2. run the while loop until the queue is not empty
        while !queue.isEmpty {
            var values = [Int]()
            //3. loop through every element inside the queue
            for node in queue {
                //4. remove the first or visited element from the queue
                // TODO: the for loop will work for the original queue and not the updated one and hence will loop though all previous values in queue
                queue.remove(at:0)
                
                //5. check for left node and insert inside the queue
                if let leftNode = node.left {
                    queue.append(leftNode)
                    values.append(leftNode.val)
                }
                
               //6. Check for right node and insert inside the queue
                if let rightNode = node.right {
                    queue.append(rightNode)
                    values.append(rightNode.val)
                }
            }
            
            // append the values collected from the loop in the array
            if !values.isEmpty{
              result.append(values)  
            }    
        }

        return result
    }
}

import Foundation

/**
 * Definition for a binary tree node
 *
 * class TreeNode {
 *    var val: Int = 0
 *    var left: TreeNode?
 *    var right: TreeNode?
 * }
 *
 */

class Solution {
	func solve(_ A: TreeNode?, _ B: inout Int) -> Int {   
    
            //1. Initiating a graph 
            var graph = [Int:[TreeNode]]()
    
            //2. Building a graph from tree node
            buildGraph(&graph,A,nil)
    
            //3. checks if the value presents in the graph and get its edges
            guard let targetNodes = graph[B] else {return 0}
            
            //4. create a set of visited nodes with Int i.e graph vertex
            var visited = Set<Int>()
    
            //5. insert given leaf as visited
            visited.insert(B)
    
           //6. insert given leaf edges in the queue
            var queue = targetNodes
            var seconds = 0
            
            // implementing BFS
            //7. Until the queue is not empty we run this while loop
            while !queue.isEmpty {
                seconds += 1
              
                //8. iterating through all the elements inside the existing queue
                print("Values inside queue before looping",queue.map{$0.val})
                for node in queue{
                  
                    //9. Removing the node from the queueu
                    queue.remove(at: 0)
                    print("removing node",node.val,"from queue")
                    
                    //10. check if edges are present for particular queue and insert it inside the queue
                    guard let nodes = graph[node.val] else {continue}
                    print("attemping to append nodes",nodes.map{$0.val})
                  
                    //11. check which edge node is not visited and insert it inside the queue
                    for i in nodes{
                      
                        //12. check if visited contains the node if not than insert inside the queue
                        if !visited.contains(i.val){
                            print("appending",i.val,"in the queue")
                            queue.append(i)
                        }else{
                            print("node is already in visited =>",i.val)
                        }
                    }
                      
                    //13. adding the node to visited 
                    print("adding node",node.val,"to visited")
                    visited.insert(node.val)
                } 
            }
             
            // while loop is broken as queue is empty now
            print("Queue is empty now")
            
            // Return the seconds
            return seconds
	}
  
    // Buids bidirectional graph from a tree node
    func buildGraph(_ graph: inout [Int:[TreeNode]],_ node: TreeNode?,_ parent: TreeNode?) {
      
        //1.hecks if node is not nil
        guard let root = node else {
            print("empty node found")
            return}
        let value = root.val

        
       //2. insert a new vertex in the graph with value as key
        print("Inserting node value",value)
        graph[value] = []

       //3. check if node had a parent
        if let parentNode = parent {
          
            //4. inserts the edge node on exisiting vertex with parent node
            graph[value]!.append(parentNode)
          
            //5. Insert the edge child on parent vertex
            graph[parentNode.val]!.append(root)
        }
        
        //6. check if node have left child and insert as edge
        if let leftNode = root.left{
            buildGraph(&graph,leftNode,root)
        }

       //7. checks if node have right child and insert as edge
        if let rightNode = root.right{
            buildGraph(&graph,rightNode,root)
        }
    }
}

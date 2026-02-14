/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head?.next != nil else {return false}
        
        var slowPointer = head
        var fastPointer = head
        
        while fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            if let fast = fastPointer?.next?.next {
                fastPointer = fast
            }else{
                break
            }
            
            if slowPointer === fastPointer{
                return true
            }
        }
        
        return false
    }
}

// Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.
// k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.
// You may not alter the values in the list's nodes, only nodes themselves may be changed.

// Input: head = [1,2,3,4,5], k = 2
// Output: [2,1,4,3,5]

// Input: head = [1,2,3,4,5], k = 3
// Output: [3,2,1,4,5]

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let root = head else { return head}
        
        var current = head
        var previous: ListNode?
        var count = 0
        
        guard isReversable(root,k) else {return current}
        
        while current != nil && count < k {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
            count += 1
        }
        
        if current != nil {
            root.next = reverseKGroup(current,k)
        }
        
        return previous
    }
    
    func isReversable(_ head: ListNode?, _ k: Int) -> Bool {
        var current = head
        var count = 0
        
        while current != nil && count < k{
            current = current?.next
            count += 1
        }
        
        return count == k
    }
}

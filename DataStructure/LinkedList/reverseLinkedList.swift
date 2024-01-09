class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current = head
        var previous:ListNode? = nil
        
        while(current != nil) {
            var temp = current?.next
            current?.next = previous
            previous = current
            current = temp
        }
        
        return previous
    }
}

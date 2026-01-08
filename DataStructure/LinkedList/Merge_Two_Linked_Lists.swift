func mergeLinkedLists(headA: LinkedListNode<Int>, headB: LinkedListNode<Int>) -> LinkedListNode<Int>{
    // we will create a dummy node which will be the first node
    let dummyNode = LinkedListNode<Int>(value: 0)
    var a: LinkedListNode<Int>? = headA
    var b: LinkedListNode<Int>? = headB
    
    // we will create a tail node which will always be the last node of the linked list
    var tail = dummyNode
    
    // we will run a while loop and keep updating tail node to next and check for headA data and headB data values
    while true {
        
        // check if a is nil
        if a == nil {
           // reference the tail next to b head
            tail.next = b
           // break
            break
        }
        
        // check if b is nil
        if b == nil{
          // reference the tail next to a head
            tail.next = a
          // break
            break
        }
        
        if a!.value <= b!.value {
            tail.next = a
            a = a!.next
        }else {
            tail.next = b
            b = b!.next
        }
        
        tail = tail.next!
    }

    // return dummyNode.Next
    return dummyNode.next!
}

let listA = LinkList<Int>()
listA.append(value: 10)
listA.append(value: 21)
listA.append(value: 100)
listA.print()

let listB = LinkList<Int>()
listB.append(value: 9)
listB.append(value: 22)
listB.append(value: 101)
listB.print()

let listC = LinkList<Int>()
listC.head = mergeLinkedLists(headA: listA.head!, headB: listB.head!)
listC.print()


// OUTPUT
// Head(10) -> (21) -> Tail(100)
// Head(9) -> (22) -> Tail(101)
// Head(9) -> (10) -> (21) -> (22) -> (100) -> Tail(101)

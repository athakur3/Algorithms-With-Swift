class LinkedListNode<T> {
    var value: T
    weak var previous: LinkedListNode?
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}


class LinkList<T> {
    typealias Node = LinkedListNode<T>
    
    var head: Node?
    var tail: Node? {
        if last === head {
            return nil
        }
        return last
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        guard var node = head else {return nil}
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    var count: Int {
        guard var node = head else { return 0}
        
        var count = 1
        
        while let next = node.next{
            node = next
            count += 1
        }
        
        return count
    }
    
    func print() {
        guard var node = head else {Swift.print("empty"); return}
        var str = "Head(\(node.value))"
        
        while let next = node.next {
            node = next
            str += next.next == nil ? " -> Tail(\(next.value))" : " -> (\(next.value))"
        }
        
        Swift.print(str)
    }
    
    func append(value : T) {
        let newNode = Node(value: value)
        
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func reverse() {
        var node = head
        
        while let currentNode = node {
            node = currentNode.next
            // swap the previous and next references
            let previous = currentNode.previous
            currentNode.previous = node
            currentNode.next = previous
            head = currentNode
        }
    }
    
    func insert(atIndex index: Int, value: T) {
        let newNode = Node(value: value)
        
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(atIndex: index - 1 )
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            
            for _ in 1 ..< index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            
            return node!
        }
    }
}

let list = LinkList<String>()
list.isEmpty
list.first
list.append(value: "Test1")
list.append(value: "Test2")
list.append(value: "Test3")
list.last?.value
list.count
//list.insert(atIndex: 1, value: "Func")
//list.node(atIndex: 2)
//list.print()

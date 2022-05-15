typealias LinkedListNode<T> = DoublyLinkedList<T>.Node<T>

final class DoublyLinkedList<T>{
    
    final class Node<T> {
        var payload: T
        var previous: Node<T>?
        var next: Node<T>?
        
        init(payload: T){
            self.payload = payload
        }
    }
    
    private(set) var count:Int = 0
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    func addToHead(_ payload: T) -> Node<T>{
        let node = Node(payload: payload)
        defer{
            head = node
            count += 1
        }
        
        guard let head = head else {
            tail = node
            return node
        }
        
        head.previous = node
        
        node.next = head
        node.previous = nil
        
        return node
    }
    
    func moveToHead(node: Node<T>?) {
        guard node !== head else {return}
        let next = node?.next
        let previous = node?.previous
        
        previous?.next = next
        next?.previous = previous
        
        node?.previous = nil
        node?.next = head
        
        if tail === node {
            tail = previous
        }
        
        self.head = node
    }
    
    func removeLast() -> Node<T>?{
        guard let tail = tail else {return nil}
        
        let previous = tail.previous
        previous?.next = nil
        self.tail = previous
        
        if count == 1{
            head = nil
        }
        
        count -= 1
        
        return tail
    }
}

final class CacheLRU<Key: Hashable,Value>{
    
    private struct CachePayload{
        let key: Key
        let value: Value
    }
    
    private let list = DoublyLinkedList<CachePayload>()
    private var nodeDict = [Key: LinkedListNode<CachePayload>]()
    
    private let capacity: Int
    
    init(capacity: Int){
        self.capacity = capacity
    }
    
    func setValue(_ value: Value,for key: Key) {
        let payload = CachePayload(key:key,value:value)
        let node = LinkedListNode(payload:payload)

        if let existingNode = nodeDict[key] {
            existingNode.payload = payload
            list.moveToHead(node:existingNode)
        }else{
            list.addToHead(payload)
            nodeDict[key] = node
        }
            
        if list.count > capacity{
            let removedNode = list.removeLast()
            if let key = removedNode?.payload.key{
                 nodeDict[key] = nil
            }
        }
    }
    
    func getValue(for key: Key) -> Value?{
        guard let node = nodeDict[key] else {return nil}
        list.moveToHead(node:node)
        return node.payload.value
    }
}

let cache = CacheLRU<Int, String>(capacity: 2)

cache.getValue(for: 5) // nil
    
cache.setValue("One", for: 1)
cache.setValue("Eleven", for: 11)
cache.setValue("Twenty", for: 20)

cache.getValue(for: 1) // nil. We exceeded the capacity with the previous `setValue`  and `1` was the last element.
cache.getValue(for: 11) // Eleven

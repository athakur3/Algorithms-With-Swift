class PriorityQueue<T:Comparable> {
    private var heap: [T] = []
    private var comparator: (T,T) -> Bool
    
    // Init
    init(comparator: @escaping (T,T) -> Bool) {
        self.comparator = comparator
    }
    
    func enqueue(_ element: T) {
        heap.append(element)
        bubbleUp(heap.count - 1)
    }
    
    func deqeue() -> T? {
        guard heap.count >= 0 else { return nil }
        let item = heap.first
        if heap.count > 1 {
            heap[0] = heap[heap.count - 1]
            heapify(0)
        }
        heap.removeLast()
        return item
    }
    
    func printQueue() {
        print(heap)
    }
    
    // Private
    
    private func bubbleUp(_ index: Int) {
        // we check if the index is > 0 or not
        // we get the parent index with formula (index - 1)/2
        // we compare if the index is > 0 and if the parent value satify the comparator or now
        // if yes than swap and repeat the bubbleing up
        
        guard index > 0 else {
            return
        }
        
        let parentIndex = (index - 1)/2
        
        if comparator(heap[index],heap[parentIndex]) {
            swap(index, parentIndex)
            bubbleUp(parentIndex)
        }
    }


    private func heapify(_ index: Int) {
        // 1. Get left and right indexes of the child using (2* index + 1) and (2*index + 2)
        // 2. Store the index in best variable
        // 3. check if left index satifies heap length and compare the with best index
        //    3.a Store index in best of comparator satifies
        // 4. Check similar for right and store on best
        // 5. If best is changed or != index 
        //   5.a Swap the best with index
        //    5.b Heapify again
        // 6. The recussion will terminate when best == index 

      
        let leftIndex = 2 * index + 1
        let rightIndex = 2 * index + 2
        
        var best = index
        
        if leftIndex < heap.count, comparator(heap[leftIndex], heap[best]) {
            best = leftIndex
        }
        
        if rightIndex < heap.count, comparator(heap[rightIndex], heap[best]) {
            best = rightIndex
        }
        
        if best != index {
            swap(best, index)
            heapify(best)
        }
    }
    
    private func swap(_ i: Int, _ j: Int) {
        var temp = heap[i]
        heap[i] = heap[j]
        heap[j] = temp
    }
}

// Creating queue
let queue = PriorityQueue<Int> { left, right in
    left < right
}

queue.enqueue(1)
queue.enqueue(5)
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(2)
queue.printQueue()
// Output [1, 2, 3, 5, 4]

queue.deqeue()
queue.printQueue()
queue.deqeue()
queue.printQueue()
queue.deqeue()
queue.printQueue()
queue.deqeue()
queue.printQueue()
queue.deqeue()
queue.printQueue()

// Output
// [2, 4, 3, 5]
// [3, 4, 5]
// [4, 5]
// [5]
// []


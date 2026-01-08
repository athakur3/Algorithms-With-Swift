class Graph {
    private var adjacencyList: [String: Set<String>] = [:]
    
    func addNode(_ node: String) {
        if adjacencyList[node] == nil {
            adjacencyList[node] = []
        }
    }
    
    func addEdge(to: String, from: String) {
        addNode(to)
        addNode(from)
        adjacencyList[to]?.insert(from)
        adjacencyList[from]?.insert(to)
    }
    
    func print() {
        for (key,value) in adjacencyList {
            Swift.print("\(key) : \(value.joined(separator: "->"))")
        }
    }
}

let graph = Graph()

graph.addEdge(to: "A", from: "B")
graph.addEdge(to: "A", from: "C")
graph.addEdge(to: "B", from: "D")
graph.print()

// B : A->D
// C : A
// D : B
// A : B->C

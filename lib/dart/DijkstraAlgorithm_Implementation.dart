import 'dart:collection';

/// Implementation of Dijkstra's algorithm to find the shortest path in a graph
/// from a start node to all other nodes.
/// Using 
///  1. a priority queue to keep track of the nodes with the smallest distance.
///  2. a hash set to keep track of the visited nodes.
///  3. a hash map to keep track of the distances from the start node to all other nodes.
///  4. a hash map to keep track of the graph.
///  5. a node class to represent a node in the priority queue.
///  6. an edge class to represent an edge in the graph.
class Graph {
  final HashMap<String, List<Edge>> adjList = HashMap();

  void addEdge(String from, String to, int weight) {
    if (!adjList.containsKey(from)) {
      adjList[from] = [];
    }
    adjList[from]!.add(Edge(to, weight));

    // Ensure that the 'to' node is also in the adjacency list
    if (!adjList.containsKey(to)) {
      adjList[to] = [];
    }
  }

  List<String> get nodes => adjList.keys.toList();
}

class Edge {
  final String node;
  final int weight;

  Edge(this.node, this.weight);
}

class Dijkstra {
  final Graph graph;

  Dijkstra(this.graph);

  HashMap<String, int> shortestPath(String start) {
    final distances = HashMap<String, int>();
    final priorityQueue =
        PriorityQueue<Node>((a, b) => a.distance.compareTo(b.distance));
    final visited = HashSet<String>();

    const infinity = 1 << 31;

    // Initialize distances with a large number (representing infinity)
    for (var node in graph.nodes) {
      distances[node] = infinity;
    }
    distances[start] = 0;

    // Add the start node to the priority queue
    priorityQueue.add(Node(start, 0));

    while (priorityQueue.isNotEmpty) {
      final currentNode = priorityQueue.removeFirst();
      if (visited.contains(currentNode.node)) continue;

      visited.add(currentNode.node);

      for (var edge in graph.adjList[currentNode.node]!) {
        final newDistance = distances[currentNode.node]! + edge.weight;
        if (newDistance < distances[edge.node]!) {
          distances[edge.node] = newDistance;
          priorityQueue.add(Node(edge.node, newDistance));
        }
      }
    }

    return distances;
  }
}

class Node {
  final String node;
  final int distance;

  Node(this.node, this.distance);
}

void main() {
  // Create a graph
  final graph = Graph();
  graph.addEdge('A', 'B', 1);
  graph.addEdge('A', 'C', 4);
  graph.addEdge('B', 'C', 2);
  graph.addEdge('B', 'D', 5);
  graph.addEdge('C', 'D', 1);

  // Compute the shortest paths from 'A'
  final dijkstra = Dijkstra(graph);
  final distances = dijkstra.shortestPath('A');

  // Print the shortest paths
  distances.forEach((node, distance) {
    print('Distance from A to $node is $distance');
  });
}

class PriorityQueue<T> {
  final List<T> _queue = [];
  final int Function(T a, T b) _compare;

  PriorityQueue(this._compare);

  void add(T value) {
    _queue.add(value);
    _queue.sort(_compare);
  }

  T removeFirst() {
    return _queue.removeAt(0);
  }

  bool get isEmpty => _queue.isEmpty;
  bool get isNotEmpty => _queue.isNotEmpty;
}

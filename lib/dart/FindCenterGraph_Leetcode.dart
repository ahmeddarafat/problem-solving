// Problem Name: Find Center of Star Graph
// Problem Link: https://leetcode.com/problems/find-center-of-star-graph/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math' as math;

void main() {}

class Solution {
  int findCenter(List<List<int>> edges) {
    final n = edges.length + 1;
    final adjList = HashMap<int, List<int>>();
    for (var edge in edges) {
      // add "from" in hash map
      if (adjList.containsKey(edge[0])) {
        adjList[edge[0]]!.add(edge[1]);
      } else {
        adjList[edge[0]] = [edge[1]];
      }

      // add "to" in hash map
      if (adjList.containsKey(edge[1])) {
        adjList[edge[1]]!.add(edge[0]);
      } else {
        adjList[edge[1]] = [edge[0]];
      }
      print(adjList);
    }

    int center = adjList.keys.first;
    for (var node in adjList.keys) {
      if (adjList[node]!.length > adjList[center]!.length) {
        center = node;
      }
    }

    return center;
  }
}

/// simple solution
/// The star node will be the node that is present in both edges
class Solution2 {
  int findCenter(List<List<int>> edges) {
    final e1 = edges[0];
    final e2 = edges[1];
    print(e1);
    print(e2);
    if (e2.contains(e1[0])) {
      return e1[0];
    }

    return e1[1];
  }
}

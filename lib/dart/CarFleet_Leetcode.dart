// Problem Name: Car Fleet
// Problem Link: https://leetcode.com/problems/car-fleet/

void main() {
  final s = Solution();
  print(s.carFleet(12, [10, 8, 0, 5, 3], [2, 4, 1, 1, 3]));
}

// -----------------------------------

/// Solutions

class Solution {
  int carFleet(int target, List<int> position, List<int> speed) {
    List<Car> cars = [];
    for (int i = 0; i < position.length; i++) {
      cars.add(Car(position[i], speed[i]));
    }
    cars.sort(((a, b) => a.position.compareTo(b.position)));
    final stack = Stack();

    for (var car in cars) {
      double time = (target - car.position) / car.speed;
      while (stack.length != 0 && time >= stack.top()) {
        stack.pop();
      }
      stack.push(time);
    }

    return stack.length;
  }
}

class Car {
  final int position;
  final int speed;

  Car(this.position, this.speed);
}

class Stack {
  List<double> stack = [];

  MinStack() {}

  int get length => stack.length;

  void push(double val) {
    stack.add(val);
  }

  double pop() {
    return stack.removeLast();
  }

  double top() {
    return stack.last;
  }
}

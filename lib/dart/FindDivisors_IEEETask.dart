import 'dart:io';
import 'dart:math';

void main() {
  print(findDivisors());
  print(findDivisors2());
}

List<int> findDivisors() {
  stdout.write("Please enter a number: ");
  String? input = stdin.readLineSync();

  int? number;
  if (input != null) {
    number = int.tryParse(input);
    if (number == null) {
      print("Please enter a valid number.");
      return List.empty();
    }
  }

  List<int> divisors = [];
  for (int i = 1; i <= number!; i++) {
    if (number % i == 0) {
      divisors.add(i);
    }
  }

  return divisors;
}

/// another solution
List<int> findDivisors2() {
  stdout.write("Please enter a number: ");
  String? input = stdin.readLineSync();

  int? number;
  if (input != null) {
    number = int.tryParse(input);
    if (number == null) {
      print("Please enter a valid number.");
      return List.empty();
    }
  }

  List<int> divisors = [1, number!];
  for (int i = 2; i < sqrt(number) + 1; i++) {
    if (number % i == 0) {
      divisors.add(i);
      divisors.add((number ~/ i));
    }
  }

  return divisors.toSet().toList();
}

void main() {
  print(findDivisors());
}

List<int> findDivisors() {
  print("Please enter a number:");
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

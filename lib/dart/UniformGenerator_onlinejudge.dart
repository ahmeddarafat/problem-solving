// Problem Name: Uniform Generator
// Problem Link: https://uva.onlinejudge.org/index.php?option=onlinejudge&page=show_problem&problem=349

// Problem Idea:
//        - if step & mod have same factor other than 1 ,then they are bad choise

import 'dart:io';
import 'dart:math';

void main() {
  late int step, mod;
  bool isGood = true;
  List<String> inputs = stdin.readLineSync()!.split(' ');
  step = int.parse(inputs[0]);
  mod = int.parse(inputs[1]);
  var factor1 = getFactors(step);
  var factor2 = getFactors(mod);
  for (int i = 0; i < factor1.length; i++) {
    for (int j = 0; j < factor2.length; j++) {
      if (factor1[i] == factor2[j] && factor1[i] > 1 && factor2[j] > 1) {
        isGood = false;
        break;
      }
    }
  }
  isGood ? print("Good Choise") : print("Bad Choise");
}

List<int> getFactors(int n) {
  List<int> factors = [];
  for (int i = 1; i <= sqrt(n); i++) {
    if (n % i == 0) {
      if (n / i == i) {
        factors.add(i);
      } else {
        factors.add(i);
        factors.add(n ~/ i); // (n/i).toInt()
      }
    }
  }
  return factors;
}
// -----------------------------------

// another soluiton
//    - gcd mehtod does the same function as the above solution

void main() {
  late int step, mod;
  List<String> inputs = stdin.readLineSync()!.split(' ');
  step = int.parse(inputs[0]);
  mod = int.parse(inputs[1]);

  if (step.gcd(mod) == 1) {
    print("Good Choise");
  } else {
    print("Bad Choise");
  }
}

// ----------------------------------------------------

// another solution

void main(List<String> args) {
  late int step, mod;
  bool isGood = true;
  List<String> inputs = stdin.readLineSync()!.split(' ');
  step = int.parse(inputs[0]);
  mod = int.parse(inputs[1]);
  List<bool> flaged = List.generate(mod, (_) => false);
  int seed = 0;
  for (int i = 0; i < mod; i++) {
    seed = (seed + step) % mod;
    if (!flaged[seed]) {
      flaged[seed] = true;
    } else {
      isGood = false;
      break;
    }
  }
  isGood ? print("Good Choise") : print("Bad Choise");
}

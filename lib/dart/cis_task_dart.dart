import 'dart:io';

void main(List<String> args) {
  int result= 1;
  List<String> inputs = stdin.readLineSync()!.split(' ');
  for (int i = 0; i < 4; i++) {
    result *=int.parse(inputs[i]);
  }
  String strResult = result.toString();
  print(strResult.substring(strResult.length-2));
  
}
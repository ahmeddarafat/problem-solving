// Problem Name: Design HashMap
// Problem Link: https://leetcode.com/problems/design-hashmap/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:dart_modules/tasks/task.dart';

void main() {
  final myHashMap = MyHashMap();
  myHashMap.put(0, 2);
  myHashMap.put(1, 2);
  myHashMap.put(2, 3);
  myHashMap.put(3, 4);
  myHashMap.put(4, 5);
  myHashMap.put(4, 5);
  myHashMap.put(4, 6);
  myHashMap.put(3, 5);
  print( myHashMap.get(4));
  myHashMap.remove(4);
  print( myHashMap.get(4));


}

class Pair {
  final int key;
  int value;
  Pair(this.key, this.value);

  @override
  String toString() {
    return '{$key, $value}';
  }
}

class MyHashMap {
  // hash function [key % size]
  final _loadFactor = 0.7;
  int _pairsNumber = 0;
  int _size = 10;
  var _map = List<List<Pair>>.generate(10, (_)=>[]);

  void put(int key, int value) {
    bool isAdded = false;
    List<Pair> pairs = _map[_getSlotIndex(key)];
    for (int i = 0; i < pairs.length; i++) {
      Pair pair = pairs[i];
      if (key == pair.key) {
        pair.value = value;
        isAdded = true;
        break;
      }
    }
    if (!isAdded) {
      pairs.add(Pair(key, value));
      _pairsNumber++;
    }

    if (_pairsNumber / _size >= _loadFactor) {
      _rehash();
    }

    print(_map);
  }

  int get(int key) {
    List<Pair> pairs = _map[_getSlotIndex(key)];
    for (int i = 0; i < pairs.length; i++) {
      Pair pair = pairs[i];
      if (key == pair.key) {
        return pair.value;
      }
    }
    return -1;
  }

  void remove(int key) {
    int index = _getSlotIndex(key);
    List<Pair> pairs = _map[index];
    for (int i = 0; i < pairs.length; i++) {
      Pair pair = pairs[i];
      if (key == pair.key) {
        pairs.removeAt(i);
        _pairsNumber--;
        break;
      }
    }

    print(_map);
  }

  void _rehash() {
    int newSize = 2 * _size;
    var newMap = List<List<Pair>>.generate(newSize, (_)=>[]);
    _size = newSize;

    for (var slot in _map) {
      for (var pair in slot) {
        List<Pair> pairs = newMap[_getSlotIndex(pair.key)];
        pairs.add(pair);
      }
    }

    _map = newMap;
  }

  int _getSlotIndex(int key) {
    return key % _size;
  }
}

// Problem Name: Design HashSet
// Problem Link: https://leetcode.com/problems/design-hashset/description/

import 'dart:collection';
import 'dart:io';
import 'dart:math';

void main() {
  final myHashSet = MyHashSet2();
  myHashSet.add(1);
  myHashSet.add(2);
  myHashSet.add(2);
  myHashSet.add(1);
  myHashSet.add(6);
  myHashSet.add(7);
  myHashSet.add(9);
  myHashSet.add(10);
  myHashSet.add(22);
  myHashSet.add(3);
  myHashSet.add(33);
  myHashSet.add(90);
  myHashSet.add(236);
  myHashSet.add(95);
}

class MyHashSet {
  final List<int> arr = [];
  MyHashSet();

  void add(int key) {
    if (arr.length > key) {
      arr[key] = key;
    } else {
      for (int i = arr.length; i < key; i++) {
        arr.add(0);
      }
      arr.add(key);
    }
  }

  void remove(int key) {
    if (arr.length > key) {
      arr[key] = 0;
    }
  }

  bool contains(int key) {
    if (arr.length > key && arr[key] == key) {
      return true;
    }
    return false;
  }
}

class MyHashSet2 {
  // hash function [key % size]
  final _loadFactor = 0.7;
  int _itemsNumber = 0;
  int _size = 10;
  var _arr = List<List<int>>.generate(10, (_) => []);

  void add(int key) {
    if (contains(key)) return;

    _arr[key % _size].add(key);
    _itemsNumber++;

    if (_itemsNumber / _size >= _loadFactor) {
      _rehash();
    }

    print("arr = $_arr");
  }

  void _rehash() {
    int newSize = 2 * _size;
    var newArr = List<List<int>>.generate(newSize, (_) => []);

    for (var slot in _arr) {
      for (var key in slot) {
        newArr[key % newSize].add(key);
      }
    }

    _size = newSize;
    _arr = newArr;
  }

  void remove(int key) {
    if (contains(key)) {
      _arr[key % _size].remove(key);
      _itemsNumber--;
    }
    print("arr = $_arr");
  }

  bool contains(int key) {
    return _arr[key % _size].contains(key);
  }
}

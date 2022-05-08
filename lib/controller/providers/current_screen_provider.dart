import 'package:flutter/material.dart';

class CurrentScreenProvider extends ChangeNotifier {
  // data members
  int screenIndex = 0;

  // getters

  int get getCurrentScreen => screenIndex;

  // setters

  void changeScreen({int? index}) {
    screenIndex = index!;
    notifyListeners();
  }
}

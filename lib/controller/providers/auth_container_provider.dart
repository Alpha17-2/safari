import 'package:flutter/cupertino.dart';

class AuthContainerProvider extends ChangeNotifier {
  int index = 1;
  // getter
  int get getContainerIndex => index;

  // setter
  void setContainerIndexTo({int? newIndex}) {
    index = newIndex!;
    notifyListeners();
  }
}

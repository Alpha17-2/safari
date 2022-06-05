import 'package:flutter/cupertino.dart';

class SearchScreenProvider extends ChangeNotifier {
  final List<String> categories = [
    'Top trips',
    'Mountain',
    'Mall',
    'Park',
    'Museum',
    'Lake',
    'Beach',
    'Library',
    'Monument',
    'Aquarium'
  ];
  int selectedIndex = 0;

  // getters

  int get getSelectedIndex => selectedIndex;

  List<String> get getCategories => [...categories];

  // setters

  void setSelectedIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}

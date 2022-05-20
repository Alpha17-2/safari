import 'package:flutter/cupertino.dart';
import 'package:safari/model/visited_place_model.dart';

class VisitedPlacesProvider extends ChangeNotifier {
  final List<VisitedPlaceModel> visitedPlaces = [
    VisitedPlaceModel(
        description:
            'The Taj Mahal, is an ivory-white marble mausoleum on the right bank of the river Yamuna in the Indian city of Agra. It was commissioned in 1632 by the Mughal emperor Shah Jahan to house the tomb of his favourite wife, Mumtaz Mahal; it also houses the tomb of Shah Jahan himself.',
        id: '123456',
        dateTime: DateTime.now(),
        images: [
          'https://i.pinimg.com/564x/73/a3/8b/73a38b13285daa676b019521fd883744.jpg'
        ],
        location: 'Agra, Delhi',
        title: 'Kokkari, Samos islan Waterfalls Love - waterfallslove'),
    VisitedPlaceModel(
        description: 'new palce',
        id: '123456',
        dateTime: DateTime.now(),
        images: [
          'https://i.pinimg.com/236x/68/e1/5d/68e15df820a48f053ab66895cabffbd3.jpg'
        ],
        location: 'klk',
        title: 'klj'),
  ];

  // getters
  List<VisitedPlaceModel> get getVisitedPlaces => [...visitedPlaces];
}

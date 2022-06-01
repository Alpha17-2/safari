import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safari/controller/api_services/post_service.dart';
import 'package:safari/controller/api_services/update_service.dart';
import 'package:safari/controller/firebase_services/upload_image.dart';
import 'package:safari/model/visited_place_model.dart';
import 'package:safari/view/screens/ProfileScreen/visited_places.dart';

class VisitedPlacesProvider extends ChangeNotifier {
  bool isPosting = false;

  final List<XFile> pickedImages = [];

  final List<VisitedPlaceModel> visitedPlaces = [
    VisitedPlaceModel(
        description:
            'The Victoria Memorial is a large marble building in Central Kolkata, which was built between 1906 and 1921. It is dedicated to the memory of Queen Victoria, Empress of India from 1876 to 1901. It is now a museum under the auspices of the Ministry of Culture, and is the largest monument in the world which is dedicated to a royal.[2] The memorial lies on the Maidan and is one of the famous monuments of Kolkata.',
        id: '454',
        dateTime: DateTime.now(),
        images: [
          'https://i.pinimg.com/564x/28/fd/ff/28fdff5fb547575f7e0434ebf414d786.jpg'
        ],
        location: 'Kolkata',
        title: 'Victoria Museum'),
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
  List<XFile> get getPickedImages => [...pickedImages];
  bool get getIsPosting => isPosting;

  // setters
  void setPickedImages(List<XFile> pickedList) {
    pickedImages.addAll(pickedList);
    notifyListeners();
  }

  void removeThisImage(int index) {
    pickedImages.removeAt(index);
    notifyListeners();
  }

  void clearPickedImages() {
    pickedImages.clear();
    notifyListeners();
  }

  Future<dynamic> addVisitedPlace(
      {required String title,
      required String myUid,
      required String location,
      required DateTime dateTime,
      required String description}) async {
    isPosting = true;
    notifyListeners();
    List<dynamic> images = await getImageUrls(
        title: title,
        myUid: myUid,
        location: location,
        dateTime: dateTime,
        description: description);
    debugPrint(images.toString());

    try {
      dynamic postResponse =
          await PostService().service(endpoint: 'visited/${myUid}.json', body: {
        'title': title,
        'myUid': myUid,
        'location': location,
        'dateTime': dateTime.toString(),
        'description': description,
        'images': images,
      });
      if (postResponse != null) {
        if (postResponse.runtimeType == String) {
          return postResponse.toString();
        } else {
          dynamic updateResponse = await UpdateService().service(
              endpoint: 'visited/${myUid}/${postResponse['name']}.json',
              body: {'id': postResponse['name']});
          if (updateResponse != null) {
            if (updateResponse.runtimeType == String) {
              isPosting = false;
              visitedPlaces.add(VisitedPlaceModel(
                  description: description,
                  id: postResponse['name'],
                  dateTime: dateTime,
                  images: images,
                  location: location,
                  title: title));
              notifyListeners();
              return updateResponse.toString();
            } else {
              isPosting = false;
              notifyListeners();
              return 'OK';
            }
          }
        }
      }
    } on SocketException {
      return 'Some error occurred';
    } catch (e) {
      return 'Some error occurred';
    }
  }

  Future<List<dynamic>> getImageUrls(
      {required String title,
      required String myUid,
      required String location,
      required DateTime dateTime,
      required String description}) async {
    List<dynamic> images = [];
    int counterIndex = 0;
    for (XFile file in pickedImages) {
      String dowmloadLink = await UploadImage(
              file: File(file.path),
              imageLoaction: 'visitedPlaces/$myUid/$title/${counterIndex++}')
          .service();
      images.add(dowmloadLink);
    }
    return images;
  }
}

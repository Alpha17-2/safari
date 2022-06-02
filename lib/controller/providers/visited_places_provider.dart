import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safari/controller/api_services/post_service.dart';
import 'package:safari/controller/api_services/update_service.dart';
import 'package:safari/controller/firebase_services/upload_image.dart';
import 'package:safari/model/visited_place_model.dart';

class VisitedPlacesProvider extends ChangeNotifier {
  bool isPosting = false;

  final List<XFile> pickedImages = [];

  final List<VisitedPlaceModel> visitedPlaces = [];

  // getters
  List<VisitedPlaceModel> get getVisitedPlaces => [...visitedPlaces];
  List<XFile> get getPickedImages => [...pickedImages];
  bool get getIsPosting => isPosting;

  // setters
  void setPickedImages(List<XFile> pickedList) {
    pickedImages.addAll(pickedList);
    notifyListeners();
  }

  void clearPickedImages() {
    pickedImages.clear();
    notifyListeners();
  }

  void removeThisImage(int index) {
    pickedImages.removeAt(index);
    notifyListeners();
  }

  Future<void> addVisitedPlace(
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
      dynamic postResponse = await PostService().service(
          endpoint: 'visited/${myUid}.json',
          dislayMessage: false,
          taskMessage: '',
          body: {
            'title': title,
            'myUid': myUid,
            'location': location,
            'dateTime': dateTime.toString(),
            'description': description,
            'images': images,
          });

      if (postResponse != null) {
        
        dynamic updateResponse = await UpdateService().service(
            showMessage: true,
            taskMessage: 'New place added',
            endpoint: 'visited/${myUid}/${postResponse['name']}.json',
            body: {'id': postResponse['name']});
        if (updateResponse != null) {
          isPosting = false;
          visitedPlaces.add(VisitedPlaceModel(
              description: description,
              id: postResponse['name'],
              dateTime: dateTime,
              images: images,
              location: location,
              title: title));
          clearPickedImages();
          notifyListeners();
        } else {
          isPosting = false;
          clearPickedImages();
          notifyListeners();
        }
      } else {
        isPosting = false;
        clearPickedImages();
        notifyListeners();
      }
    } catch (e) {}
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

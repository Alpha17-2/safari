import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:safari/controller/api_services/get_service.dart';
import 'package:safari/controller/api_services/update_service.dart';
import 'package:safari/model/place_model.dart';

class PlacesProvider extends ChangeNotifier {
  List<PlaceModel> places = [];
  bool successFullApiCall = true;
  bool isLikingStatus = false;

  // getters -> These methods are used to get values

  bool get getSuccessFullApiCall {
    return successFullApiCall;
  }

  bool get getIsSavingStatus {
    return isLikingStatus;
  }

  List<PlaceModel> getLikedPlaces(String myUId) {
    return [
      ...places.where((element) => element.likedBy.contains(myUId)).toList()
    ];
  }

  List<PlaceModel> getPlaceType(String type) {
    return [...places.where((place) => place.type == type).toList()];
  }

  List<PlaceModel> get getTopTrips {
    return [...places.where((element) => element.topTrip).toList()];
  }

  List<PlaceModel> get getAllPlaces {
    return [...places];
  }

  PlaceModel getPlaceUsingId(String id) {
    int index = places.indexWhere((element) => element.id == id);
    return places[index];
  }

  // setters -> These methods are used to set values

  // This method is defined to set places , basically it calls the get api to fetch data from server and store it in the current state
  Future<dynamic> setPlaces() async {
    List<PlaceModel> tempPlaces = [];
    try {
      dynamic body = await GetService().service(endpoint: 'allplaces.json');
      if (body.runtimeType == String && body.toString() == 'no internet') {
        return 'no internet';
      }
      if (body != null && body.runtimeType != String) {
        Map<String, dynamic> data = body as Map<String, dynamic>;
        data.forEach((key, value) {
          tempPlaces.add(PlaceModel.fromJson(value as Map<String, dynamic>));
        });
        places = tempPlaces;
        successFullApiCall = true;
        notifyListeners();
        return 'OK';
      } else {
        successFullApiCall = false;
        notifyListeners();
        return body.toString();
      }
    } on SocketException {
      successFullApiCall = false;
      notifyListeners();
    } on TimeoutException {
      successFullApiCall = false;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        successFullApiCall = false;
        print(e.toString());
      }
    }
    notifyListeners();
  }

  Future<dynamic> toggleLikeOptionForPlace(
      {required String placeId, required String myUid}) async {
    isLikingStatus = true;
    notifyListeners();
    try {
      dynamic getResponse =
          await GetService().service(endpoint: 'allplaces/${placeId}.json');
      if (getResponse != null) {
        if (getResponse.runtimeType == String) {
          isLikingStatus = false;
          notifyListeners();
          return getResponse.toString();
        } else {
          PlaceModel tempModel =
              PlaceModel.fromJson(getResponse as Map<String, dynamic>);
          List<dynamic> likedBy = tempModel.likedBy;
          likedBy.contains(myUid) ? likedBy.remove(myUid) : likedBy.add(myUid);
          dynamic updateResponse = UpdateService().service(
              endpoint: 'allplaces/$placeId.json', body: {'likedBy': likedBy});
          if (updateResponse.runtimeType != String) {
            int getIndexOfPlace =
                places.indexWhere((element) => element.id == placeId);
            places[getIndexOfPlace].toggleLikeStatus(myUid);
            isLikingStatus = false;
            notifyListeners();
            return 'OK';
          } else {
            isLikingStatus = false;
            notifyListeners();
            return updateResponse.toString();
          }
        }
      } else {
        isLikingStatus = false;
        notifyListeners();
        return 'Some error occurred';
      }
    } on SocketException {
      isLikingStatus = false;
      notifyListeners();
    } on TimeoutException {
      isLikingStatus = false;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        isLikingStatus = false;
        notifyListeners();
        print(e.toString());
      }
    }
  }
}

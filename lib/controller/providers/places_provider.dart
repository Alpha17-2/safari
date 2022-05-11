import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:safari/controller/api_services/get_service.dart';
import 'package:safari/controller/constants/service_api_constants.dart';
import 'package:safari/model/place_model.dart';

class PlacesProvider extends ChangeNotifier {
  List<PlaceModel> places = [];
  bool successFullApiCall = true;

  // getters -> These methods are used to get values

  bool get getSuccessFullApiCall {
    return successFullApiCall;
  }

  List<PlaceModel> get getBeaches {
    return [...places.where((place) => place.type == 'Beach')];
  }

  List<PlaceModel> get getParks {
    return [...places.where((place) => place.type == 'Park')];
  }

  List<PlaceModel> get getMonuments {
    return [...places.where((place) => place.type == 'Monument')];
  }

  List<PlaceModel> get getMuseums {
    return [...places.where((place) => place.type == 'Museum')];
  }

  List<PlaceModel> get getLibraries {
    return [...places.where((place) => place.type == 'Library')];
  }

  List<PlaceModel> get getAquariums {
    return [...places.where((place) => place.type == 'Aquarium')];
  }

  List<PlaceModel> get getLakes {
    return [...places.where((place) => place.type == 'Lake')];
  }

  List<PlaceModel> get getTopTrips {
    return [...places.where((place) => place.topTrip)];
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
}

import 'package:flutter/foundation.dart';
import 'package:safari/controller/api_services/get_service.dart';
import 'package:safari/controller/constants/service_api_constants.dart';
import 'package:safari/model/place_model.dart';

class PlacesProvider extends ChangeNotifier {
  List<PlaceModel> places = [];
  bool loadScreenStatus = false;

  // getters -> These methods are used to get values

  bool get getLoadScreenStatus {
    return loadScreenStatus;
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

  // setters -> These methods are used to set values

  // This method is defined to set places , basically it calls the get api to fetch data from server and store it in the current state
  Future<dynamic> setPlaces() async {
    List<PlaceModel> tempPlaces = [];
    try {
      Map<String, dynamic> body =
          await service(ServiceApi.base_url + 'allplaces.json');
      if (body.runtimeType != String) {
        body.forEach((key, value) {
          tempPlaces.add(PlaceModel.fromJson(value as Map<String, dynamic>));
        });
        places = tempPlaces;
        notifyListeners();
      } else {
        if (kDebugMode) {
          print(body);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  // This method changes the load screen status to true
  void startLoading() {
    loadScreenStatus = true;
    notifyListeners();
  }

  // This method changes the load screen status to false
  void stopLoading() {
    loadScreenStatus = false;
    notifyListeners();
  }
}

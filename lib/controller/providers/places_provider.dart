import 'package:flutter/foundation.dart';
import 'package:safari/controller/api_services/get_service.dart';
import 'package:safari/controller/constants/service_api_constants.dart';
import 'package:safari/model/place_model.dart';

class PlacesProvider extends ChangeNotifier {
  final List<PlaceModel> places = [];

  // setters
  Future<dynamic> setPlaces() async {
    dynamic body = await getResponse(ServiceApi.base_url);
    if (body.runtimeType != String) {
      if (kDebugMode) {
        print(body);
      }
    } else {
      if (kDebugMode) {
        print(body);
      }
    }
  }
}

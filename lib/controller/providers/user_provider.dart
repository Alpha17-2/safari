import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:safari/controller/api_services/get_service.dart';
import 'package:safari/controller/api_services/update_service.dart';
import 'package:safari/model/user_model.dart';
import '../api_services/put_service.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentUser;
  bool? isUserFetched;

  // getters

  bool? get getIsUserFetched {
    return isUserFetched;
  }

  UserModel? get getUser {
    return currentUser;
  }

  // setters

  Future<dynamic> registerNewUser(Map<String, dynamic> userData) async {
    try {
      dynamic body =
          await PutService().service(endpoint: 'users/${userData['id']}.json', body: userData);
      if (body.runtimeType == String && body.toString() == 'no internet') {
        return 'no internet';
      } else if (body == null) {
        return 'No data found';
      } else if (body.runtimeType == String) {
        return body.toString();
      } else {
        currentUser = UserModel.fromJson(userData);
        isUserFetched = true;
        await UpdateService().service(body: {
          'docId': body['name'],
        }, endpoint: 'users/${body['name']}.json');

        notifyListeners();
        return 'OK';
      }
    } on SocketException {
      isUserFetched = false;
      notifyListeners();
      return 'Some error occurred';
    } on TimeoutException {
      isUserFetched = false;
      notifyListeners();
      return 'Some error occurred';
    } catch (e) {}
    notifyListeners();
  }

  Future<dynamic> setUser(String uid) async {
    debugPrint('setting user');
    UserModel? tempUserModel;
    try {
      dynamic body = await GetService().service(endpoint: 'users/$uid.json');
      if (body.runtimeType == String && body.toString() == 'no internet') {
        return 'no internet';
      } else if (body == null) {
        return 'No data found';
      } else if (body.runtimeType == String) {
        return body.toString();
      } else {
        Map<String, dynamic> data = body as Map<String, dynamic>;
        tempUserModel = UserModel.fromJson(data);
        currentUser = tempUserModel;
        isUserFetched = true;
        notifyListeners();
        return 'OK';
      }
    } on SocketException {
      isUserFetched = false;
      notifyListeners();
      return 'Some error occurred';
    } catch (e) {
      if (kDebugMode) {
        isUserFetched = false;
        notifyListeners();
        return 'Some error occurred';
      }
    }
    notifyListeners();
  }

  Future<dynamic> setNewTitle({required String title}) async {
    try {
      dynamic body = await UpdateService().service(
          endpoint: 'users/${currentUser!.id}.json', body: {'title': title});
      if (body == null) {
        return 'Some error occurred';
      } else if (body.runtimeType == String) {
        return body.toString();
      } else {
        return 'OK';
      }
    } on SocketException {
    } on TimeoutException {}
  }
}

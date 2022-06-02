import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:safari/controller/constants/global_context.dart';
import 'package:safari/controller/constants/service_api_constants.dart';

class UpdateService {
  Future<dynamic> service(
      {required String endpoint,
      required Map<String, dynamic> body,
      String? taskMessage,
      bool? showMessage}) async {
    try {
      final internetResponse = await InternetAddress.lookup('google.com');
      if (internetResponse.isEmpty) {
        ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
            .showSnackBar(
                const SnackBar(content: Text('No internet connection')));
        return null;
      }

      if (internetResponse.isNotEmpty &&
          internetResponse[0].rawAddress.isNotEmpty) {
        var response = await http.patch(
            Uri.parse(ServiceApi.base_url + endpoint),
            body: json.encode(body));
        int statusCode = response.statusCode;
        switch (statusCode) {
          case 200:
            if (showMessage!) {
              ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
                  .showSnackBar(SnackBar(content: Text(taskMessage!)));
            }
            return json.decode(response.body) as Map<String, dynamic>;
          case 400:
            return 'Bad request';
          case 401:
            return 'Unauthorised';
          default:
            break;
        }
      } else {
        return 'no internet';
      }
    } on SocketException catch (_) {
      return 'no internet';
    } catch (e) {
      print(e.toString());
    }
  }
}

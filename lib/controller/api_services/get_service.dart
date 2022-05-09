import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<dynamic> service(String api) async {
  try {
    final internetResponse = await InternetAddress.lookup('google.com');
    if (internetResponse.isEmpty) {
      return;
    }
    //print(internetResponse);
    if (internetResponse.isNotEmpty &&
        internetResponse[0].rawAddress.isNotEmpty) {
      var response = await http.get(Uri.parse(api));
      int statusCode = response.statusCode;
      //print(statusCode);
      switch (statusCode) {
        case 200:
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
    //print('2. no internet');
    return 'no internet';
  } catch (e) {
    print(e.toString());
  }
}

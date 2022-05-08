import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getResponse(String api) async {
  try {
    var response = await http.get(Uri.parse(api));
    int statusCode = response.statusCode;
    switch (statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorised';
      default:
        break;
    }
  } catch (e) {
    print(e.toString());
  }
}

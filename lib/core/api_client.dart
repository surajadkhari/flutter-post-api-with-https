// import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

class Apiclient {
  Future request(
      {required String path,required Map<String, dynamic> data, String type = "get"}) async {
    final response = type == "get"
        ? await http.get(Uri.parse(path))
        : await http.post(Uri.parse(path),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data));

    return response;
  }
}

final apiClientProvider = Provider<Apiclient>((ref) {
  return  Apiclient();
});
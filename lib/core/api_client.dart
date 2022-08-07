import 'dart:convert';

import 'package:http/http.dart' as http;

class Apiclient {
  Future request(
      {required String path, required Map<String, dynamic> data}) async {
    try {
      final respond = await http.post(
        Uri.parse("https://reqres.in/api/users"),
        body: jsonEncode(data),
      );
      return jsonDecode(respond.body);
    } catch (e) {
      rethrow;
    }
  }
}

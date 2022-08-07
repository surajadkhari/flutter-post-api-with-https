import 'dart:convert';
import 'dart:developer';

import 'package:flutter_http_post/core/api_constant.dart';
import 'package:http/http.dart';

import '../../core/api_client.dart';
import '../presentation/flutter_doc.dart';

class UserRepository {
  Future<Album> createUser(Map<String, dynamic> userModel) async {
    Response result =
        await Apiclient().request(path: endpoint, data: userModel);
    if (result.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      log(result.body);
      return Album.fromJson(jsonDecode(result.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}

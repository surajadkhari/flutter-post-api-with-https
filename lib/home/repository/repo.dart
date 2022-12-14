import 'dart:convert';
import 'dart:developer';
import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:http/http.dart';
import '../../core/api_client.dart';
import '../../core/api_constant.dart';
import '../data/model/user_response_model.dart';

class UserRepository {
  Future<UserResponseModel> createUser(
      UserRequestModel userrequestModel) async {
    Response result = await Apiclient()
        .request(path: endpoint, data: userrequestModel.toJson(), type: "post");
    if (result.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      log(result.body);
      return UserResponseModel.fromJson(jsonDecode(result.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to Post data.');
    }
  }
}

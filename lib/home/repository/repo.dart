import 'dart:convert';
import 'package:http/http.dart';
import '../../core/api_client.dart';
import '../../core/api_constant.dart';
import '../data/user_response_model.dart';

class UserRepository {
  Future<UserResponseModel> createUser(Map<String, dynamic> userModel) async {
    Response result =
        await Apiclient().request(path: endpoint, data: userModel);
    if (result.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return UserResponseModel.fromJson(jsonDecode(result.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}

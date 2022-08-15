import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:flutter_http_post/home/data/model/user_response_model.dart';

abstract class UserDataSource {
  Future<UserResponseModel> createUser(UserRequestModel userRequestModel);
  Future<UserResponseModel> fetchUser();
}

import 'dart:convert';

import 'package:flutter_http_post/core/api_client.dart';
import 'package:flutter_http_post/core/api_constant.dart';
import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:flutter_http_post/home/data/model/user_response_model.dart';

abstract class UserRemoteDataSource {
  Future<UserResponseModel> createUser(UserRequestModel userRequestModel);
  Future<UserResponseModel> fetchUser();
}

class UserRemoteDataSourceImp extends UserRemoteDataSource {
  @override
  Future<UserResponseModel> createUser(
      UserRequestModel userRequestModel) async {
    final result = await Apiclient()
        .request(path: endpoint, data: userRequestModel.toJson(), type: "post");
    return UserResponseModel.fromJson(jsonDecode(result.body));
  }

  @override
  Future<UserResponseModel> fetchUser() {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }
}

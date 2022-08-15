import 'dart:convert';

import 'package:flutter_http_post/core/api_client.dart';
import 'package:flutter_http_post/core/api_constant.dart';
import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:flutter_http_post/home/data/model/user_response_model.dart';
import 'package:riverpod/riverpod.dart';

abstract class UserRemoteDataSource {
  Future<UserResponseModel> createUser(UserRequestModel userRequestModel);
  Future<UserResponseModel> fetchUser();
}

class UserRemoteDataSourceImp extends UserRemoteDataSource {
  UserRemoteDataSourceImp({required this.apiclient});
  Apiclient apiclient;
  @override
  Future<UserResponseModel> createUser(
      UserRequestModel userRequestModel) async {
    final result = await apiclient.request(
      path: endpoint,
      data: userRequestModel.toJson(),
      type: "post",
    );
    return UserResponseModel.fromJson(
      jsonDecode(result),
    );
  }

  @override
  Future<UserResponseModel> fetchUser() {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }
}

final userdatasourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSourceImp(apiclient: ref.watch(apiClientProvider));
});

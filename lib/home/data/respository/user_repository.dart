import 'package:dartz/dartz.dart';
import 'package:flutter_http_post/core/app_error.dart';
import 'package:flutter_http_post/home/data/data_source/user_data_source.dart';
import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:flutter_http_post/home/data/model/user_response_model.dart';

abstract class UserReposioty {
  Future<Either<AppError, UserResponseModel>> createUser(
      UserRequestModel userRequestModel);
  Future<UserResponseModel> fetchUser();
}

class UserReposiotyImpl implements UserReposioty {
  final UserRemoteDataSource _userRemoteDataSource;
  UserReposiotyImpl(this._userRemoteDataSource);
  @override
  Future<Either<AppError, UserResponseModel>> createUser(
      UserRequestModel userRequestModel) async {
    try {
      final result = await _userRemoteDataSource.createUser(userRequestModel);
      return Right(result);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<UserResponseModel> fetchUser() {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }
}

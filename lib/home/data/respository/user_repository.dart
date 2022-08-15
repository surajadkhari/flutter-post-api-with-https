import 'package:dartz/dartz.dart';
import 'package:flutter_http_post/core/app_error.dart';
import 'package:flutter_http_post/home/data/data_source/user_data_source.dart';
import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:flutter_http_post/home/data/model/user_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserReposioty {
  Future<Either<AppError, UserResponseModel>> createUser(
      UserRequestModel userRequestModel);
  Future<Either<AppError, UserResponseModel>> fetchUser();
}

class UserReposiotyImpl implements UserReposioty {
  final UserRemoteDataSource userRemoteDataSource;
  UserReposiotyImpl({required this.userRemoteDataSource});
  @override
  Future<Either<AppError, UserResponseModel>> createUser(
    UserRequestModel userRequestModel,
  ) async {
    try {
      final result = await userRemoteDataSource.createUser(userRequestModel);

      return Right(result);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, UserResponseModel>> fetchUser() async {
    try {
      final result = await userRemoteDataSource.fetchUser();

      return Right(result);
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }
}

final userrepoProvider = Provider<UserReposioty>((ref) {
  return UserReposiotyImpl(
      userRemoteDataSource: ref.watch(userdatasourceProvider));
});

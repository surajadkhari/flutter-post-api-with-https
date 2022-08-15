import 'package:flutter_http_post/home/data/model/user_model.dart';
import 'package:flutter_http_post/home/data/model/user_response_model.dart';
import 'package:flutter_http_post/home/data/respository/user_repository.dart';
import 'package:riverpod/riverpod.dart';

class CreateUserNotifier extends StateNotifier<AsyncValue<UserResponseModel>> {
  UserReposioty userReposioty;
  CreateUserNotifier(this.userReposioty) : super(const AsyncValue.loading());

  postUser(UserRequestModel userRequestModel) async {
    final result = await userReposioty.createUser(userRequestModel);
    return result.fold(
      (l) => state = AsyncValue.error(l),
      (r) {
        return state = AsyncValue.data(r);
      },
    );
  }
}

final createuserProvider =
    StateNotifierProvider<CreateUserNotifier, AsyncValue<UserResponseModel>>(
        (ref) {
  return CreateUserNotifier(ref.watch(userrepoProvider));
});

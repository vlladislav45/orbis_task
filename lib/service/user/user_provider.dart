
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:orbis_task/api/user_api.dart';
import 'package:orbis_task/model/user.dart';
import 'package:orbis_task/service/user/user_state.dart';

final userNotifierProvider = StateNotifierProvider.autoDispose<UserNotifier, UserState>(
      (ref) => UserNotifier(
    GetIt.I.get<UserAPI>(),
  ),
);

class UserNotifier extends StateNotifier<UserState> {
  final UserAPI _userAPI;

  UserNotifier(this._userAPI) : super(InitialUserState());

  void getUser(String username) async {
    state = SingleUserLoadingState();

    try {
      final User? user = await _userAPI.getSingleUser(username);
      if(user != null) {
        state = SingleUser(user);
      }
    } catch (e) {
      state = SingleUserErrorState('Error while fetching users, ${e.toString()}');
    }
  }
}

import 'package:get_it/get_it.dart';
import 'package:orbis_task/api/user_api.dart';
import 'package:orbis_task/model/user.dart';
import 'package:orbis_task/service/users/users_state.dart';
import 'package:riverpod/riverpod.dart';

final usersNotifierProvider = StateNotifierProvider.autoDispose<UsersNotifier, UsersState>(
      (ref) => UsersNotifier(
        GetIt.I.get<UserAPI>(),
      ),
);

class UsersNotifier extends StateNotifier<UsersState> {
  final UserAPI _userAPI;

  UsersNotifier(this._userAPI) : super(InitialUsersState());

  void getUsers() async {
    state = UsersLoadingState();

    try {
      final List<User>? users = await _userAPI.getUsers();
      if(users != null && users.isNotEmpty) {
        state = GetUsersState(users);
      }
    } catch (e) {
      state = UsersErrorState('Error while fetching users, ${e.toString()}');
    }
  }
}
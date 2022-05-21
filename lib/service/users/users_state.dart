
import 'package:orbis_task/model/user.dart';

abstract class UsersState {
  const UsersState();

  @override
  List<Object> get props => [];
}

class InitialUsersState extends UsersState { }

class GetUsersState extends UsersState {
  late List<User> users;

  GetUsersState(this.users);
}

class UsersLoadingState extends UsersState { }
class UsersErrorState extends UsersState {
  final String error;

  UsersErrorState(this.error);
}


import 'package:orbis_task/model/user.dart';

abstract class UserState {
  const UserState();

  @override
  List<Object> get props => [];
}

class InitialUserState extends UserState { }

class SingleUser extends UserState {
  late User user;

  SingleUser(this.user);
}

class SingleUserLoadingState extends UserState { }
class SingleUserErrorState extends UserState {
  final String error;

  SingleUserErrorState(this.error);
}


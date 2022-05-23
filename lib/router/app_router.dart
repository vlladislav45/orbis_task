
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:orbis_task/api/project_api.dart';
import 'package:orbis_task/api/user_api.dart';
import 'package:orbis_task/model/args/profile_argument.dart';
import 'package:orbis_task/presentation/screens/home.dart';
import 'package:orbis_task/presentation/screens/profile.dart';

class AppRouter {
  late UserAPI _userAPI;
  late ProjectAPI _projectAPI;

  AppRouter() {
    _userAPI = UserAPI();
    _projectAPI = ProjectAPI();

    GetIt.I.registerFactory<UserAPI>(() => _userAPI);
    GetIt.I.registerFactory<ProjectAPI>(() => _projectAPI);
  }


  Route? onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/': {
        return MaterialPageRoute(settings: const RouteSettings(name: '/'), builder: (_) => HomePage());
      }
      case '/profile': {
        ProfileArgument argument = settings.arguments != null ? settings.arguments as ProfileArgument : ProfileArgument('mojombo');
        return MaterialPageRoute(settings: const RouteSettings(name: '/profile'), builder: (_) => ProfilePage(username: argument.username));
      }
      default: {
        return null;
      }
    }
  }
}
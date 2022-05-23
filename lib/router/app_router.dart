
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:orbis_task/api/user_api.dart';
import 'package:orbis_task/model/args/profile_argument.dart';
import 'package:orbis_task/presentation/screens/home.dart';
import 'package:orbis_task/presentation/screens/profile.dart';

class AppRouter {
  late UserAPI userAPI;

  AppRouter() {
    userAPI = UserAPI();

    GetIt.I.registerFactory<UserAPI>(() => userAPI);
  }


  Route? onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/': {
        return MaterialPageRoute(settings: const RouteSettings(name: '/'), builder: (_) => HomePage());
      }
      case '/profile': {
        // for test purposes
        ProfileArgument argument = settings.arguments != null ? settings.arguments as ProfileArgument : ProfileArgument('mojombo');
        return MaterialPageRoute(settings: const RouteSettings(name: '/profile'), builder: (_) => ProfilePage(username: argument.username));
      }
      default: {
        return null;
      }
    }
  }
}
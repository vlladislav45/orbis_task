
import 'package:dio/dio.dart';
import 'package:orbis_task/api/base_api.dart';
import 'package:orbis_task/model/user.dart';

class UserAPI extends BaseAPI {
  Future<List<User>?> getUsers() async {
    try {
      Response response = await dio.get('$baseUrl/users', options: Options(
          validateStatus: (status) {
            return status! < 500;
          }
      ));
      if(response.statusCode == 200) {
        List<dynamic> json = response.data;
        return json.map((item) => User.fromJson(item)).toList();
      }
      return null;
    } on Exception catch (e) {
      return Future.error('Unexpected error 😢 ${e.toString()}');
    }
  }

  Future<User?> getSingleUser(String username) async {
    try {
      Response response = await dio.get('$baseUrl/users/$username', options: Options(
          validateStatus: (status) {
            return status! < 500;
          }
      ));
      if(response.statusCode == 200) {
        Map<String, dynamic> json = response.data;
        return User.fromJson(json);
      }
      return null;
    } on Exception catch (e) {
      return Future.error('Unexpected error 😢 ${e.toString()}');
    }
  }
}
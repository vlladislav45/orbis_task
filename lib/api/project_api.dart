
import 'package:dio/dio.dart';
import 'package:orbis_task/model/project.dart';

import 'base_api.dart';

class ProjectAPI extends BaseAPI {
  Future<List<Project>?> getProjectsByUsername(String username) async {
    final String owner = username;
    try {
      Response response = await dio.get('$baseUrl/repos/$owner/projects', options: Options(
          validateStatus: (status) {
            return status! < 500;
          }
      ));
      if (response.statusCode == 200) {
        List<dynamic> json = response.data;
        return json.map((item) => Project.fromJson(item)).toList();
      }
      return null;
    } on Exception catch (e) {
      return Future.error('Unexpected error 😢 ${e.toString()}');
    }
  }
}
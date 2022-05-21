
import 'dart:io';

import 'package:dio/dio.dart';

abstract class BaseAPI {
  late Dio dio;
  final String baseUrl = 'https://api.github.com';

  BaseAPI() {
    initialize();
  }

  void initialize() async {
    dio = Dio(BaseOptions(
      connectTimeout: 30000,
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
    ));
  }
}
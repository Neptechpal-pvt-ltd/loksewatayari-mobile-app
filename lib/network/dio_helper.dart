import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:loksewa/core/const/host_url.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: HostUrl.baseUrl,
      receiveDataWhenStatusError: true,
    ));

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      // Config the client.
      client.findProxy = (uri) {

        return 'PROXY 192.168.18.161:8000';
      };

      return client;
    },
  );
}
}

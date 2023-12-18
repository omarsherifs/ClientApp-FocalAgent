// ignore_for_file: strict_raw_type

import 'package:client_app_focal_agent/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class MockedApiCaller {
  MockedApiCaller() {
    init();
  }
  late DioAdapter dioAdapter;
  Dio dio = Dio();

  void init() {
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
    dioAdapter
      ..onGet(
        NetworkPaths.hrDataPath,
        (request) => request.reply(200, [
          {
            'id': 1,
            'firstName': 'Omar',
            'lastName': 'Sherif',
          },
          {
            'id': 2,
            'firstName': 'John',
            'lastName': 'John',
          },
          {
            'id': 3,
            'firstName': 'Don',
            'lastName': 'Don',
          },
          {
            'id': 4,
            'firstName': 'Khaled',
            'lastName': 'Magdy',
          },
        ]),
      )
      ..onGet(
        NetworkPaths.itDataPath,
        (request) => request.reply(200, [
          {
            'id': 1,
            'firstName': 'Omar',
            'lastName': 'Sherif',
          },
          {
            'id': 2,
            'firstName': 'John',
            'lastName': 'John',
          },
          {
            'id': 3,
            'firstName': 'Don',
            'lastName': 'Don',
          },
          {
            'id': 4,
            'firstName': 'Khaled',
            'lastName': 'Magdy',
          },
        ]),
      );
  }

  Future<Response> getData(String path) async {
    try {
      /// i used this delay you give time
      //  to see the loading animation
      await Future.delayed(const Duration(seconds: 2));
      return dio.get(path);
    } on DioException catch (e) {
      throw ServerException(
        statusCode: e.response?.statusCode ?? 500,
        message: e.message ?? '--',
      );
    }
  }
}

class NetworkPaths {
  static String hrDataPath = 'https://example.com/hrEmployees';
  static String itDataPath = 'https://example.com/ItEmployees';
}

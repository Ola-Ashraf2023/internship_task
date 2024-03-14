import 'package:dio/dio.dart';

import '../utils/constants.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String endPoint, required Map<String, dynamic>? data}) {
    return dio.get(Constants.BASEURL + endPoint, queryParameters: data);
  }

  Future<Response> postData(
      {required String endPoint,
      required Map<String, dynamic> body,
      String? token}) {
    return dio.post(Constants.BASEURL + endPoint, data: body);
  }
}

import 'package:dio/dio.dart';

class ApiService {
  final baseUrl = 'https://student.valuxapps.com/api/';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getDate({required String endPoint}) async {
    dio.options.headers = {'Content-Type': 'application/json', 'lang': 'en'};
    final response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> postData(
      {required String endPoint, required Object? data}) async {
    dio.options.headers = {'Content-Type': 'application/json', 'lang': 'en'};
    final response = await dio.post('$baseUrl$endPoint', data: data);

    return response.data;
  }
}



import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future<Response> get(String url);
  Future <Response> post(String url, dynamic body);
}

class NetworkServicesImpl implements NetworkServices{
  final Dio _dio;
  NetworkServicesImpl(this._dio);

  @override
  Future<Response> get(String url) async{
  final response  = await _dio.get(url);
  return response.data;
  }

  @override
  Future<Response> post(String url, dynamic body)async {
    final response = await _dio.post(url,data: body);
    return response.data;
  }

}
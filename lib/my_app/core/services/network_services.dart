

import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future<dynamic> get(String url);
  Future <dynamic> post(String url, dynamic body);
}

class NetworkServicesImpl implements NetworkServices{
  final Dio _dio;
  NetworkServicesImpl(this._dio);

  @override
  Future<dynamic> get(String url) async{
  final response  = await _dio.get(url);
  return response.data;
  }

  @override
  Future post(String url, dynamic body)async {
    final response = await _dio.post(url,data: body);
    return response.data;
  }

}
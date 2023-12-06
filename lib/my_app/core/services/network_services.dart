

import 'package:dio/dio.dart';

abstract class NetworkServices {
  Future<dynamic> get(String url);
  Future <dynamic> post(String url, dynamic body);
}

class NetworkServicesImpl implements NetworkServices{
  final Dio _dio;
  NetworkServicesImpl(this._dio);

  @override
  Future get(String url) async{
  final response  = _dio.get(url);

  }

  @override
  Future post(String url, dynamic body) {
    final response = _dio.post(url,data: body);
    return response;
  }

}
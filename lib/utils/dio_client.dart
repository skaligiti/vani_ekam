import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  _(){}

  static final DioClient _instance = DioClient._internal();

  factory DioClient.getInstance() => _instance;

  DioClient._internal() {
    _dio = Dio();
  }

  Future<Response<T>> get<T>(String url) {
    return _dio.get<T>(url, );
  }


}
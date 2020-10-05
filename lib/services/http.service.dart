import 'package:dio/dio.dart';
import 'package:flutter_challenge/constants/constants.dart';

class HTTPService {
  static BaseOptions _options = BaseOptions(
      connectTimeout: 6000,
      receiveTimeout: 3000,
      headers: {"Content-Type": "application/json; charset=utf-8"});

  final Dio _instance;

  HTTPService({String baseUrl = rootUrl, InterceptorsWrapper interceptor})
      : _instance = new Dio(HTTPService._options.merge(baseUrl: baseUrl)) {
    if (interceptor != null) {
      _instance.interceptors.add(interceptor);
    }
  }

  /// Send a GET-request
  ///
  /// Sends a GET-request on provided [url] with [params].
  Future<Response> get(String url, {Map<String, dynamic> params = const {}}) =>
      _instance.get(url, queryParameters: params);

  /// Send a POST-request
  ///
  /// Sends a POST-request on provided [url] with raw [data], which will be converted to FormData.
  Future<Response> post(String url, {Map<String, dynamic> data = const {}}) {
    FormData formData = new FormData.fromMap(data);
    return _instance.post(url, data: formData);
  }

  /// Send a PATCH-request
  ///
  /// Sends a PATCH-request on provided [url] with raw [data], which will be converted to FormData, and [headers].
  Future<Response> patch(
    String url, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic> headers = const {},
  }) {
    FormData formData = new FormData.fromMap(data);
    Options options = new Options(headers: headers);
    return _instance.patch(url, data: formData, options: options);
  }

  /// Send a PUT-request
  ///
  /// Sends a PUT-request on provided [url] with raw [data], which will be converted to FormData.
  Future<Response> put(String url, {Map<String, dynamic> data = const {}}) {
    FormData formData = new FormData.fromMap(data);
    return _instance.put(url, data: formData);
  }

  /// Send a DELETE-request
  ///
  /// Sends a DELETE-request on provided [url] with [params].
  Future<Response> delete(String url, {Map<String, dynamic> params = const {}}) =>
      _instance.delete(url, queryParameters: params);
}

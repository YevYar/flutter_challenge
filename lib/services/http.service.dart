import 'package:dio/dio.dart';
import 'package:flutter_challenge/constants/constants.dart';

class HTTPService {
  static BaseOptions _options = BaseOptions(
    connectTimeout: 6000,
    receiveTimeout: 3000,
    headers: {"Content-Type": "application/json; charset=utf-8"}
  );

  final Dio _instance;
  final String baseUrl;

  HTTPService({String baseUrl = rootUrl})
      : _instance = new Dio(HTTPService._options.merge(baseUrl: baseUrl)),
        baseUrl = baseUrl;

  /// Send a GET-request
  ///
  /// Sends a GET-request on provided [url] with [params].
  get(String url, {Map<String, dynamic> params = const {}}) {
    return this._instance.get(url, queryParameters: params);
  }

  /// Send a POST-request
  ///
  /// Sends a POST-request on provided [url] with raw [data], which will be converted to FormData.
  post(String url, {Map<String, dynamic> data = const {}}) {
    FormData formData = new FormData.fromMap(data);
    return this._instance.post(url, data: formData);
  }

  /// Send a PATCH-request
  ///
  /// Sends a PATCH-request on provided [url] with raw [data], which will be converted to FormData, and [headers].
  patch(
    String url, {
    Map<String, dynamic> data = const {},
    Map<String, dynamic> headers = const {},
  }) {
    FormData formData = new FormData.fromMap(data);
    Options options = new Options(headers: headers);
    return this._instance.patch(url, data: formData, options: options);
  }

  /// Send a PUT-request
  ///
  /// Sends a PUT-request on provided [url] with raw [data], which will be converted to FormData.
  put(String url, {Map<String, dynamic> data = const {}}) {
    FormData formData = new FormData.fromMap(data);
    return this._instance.put(url, data: formData);
  }

  /// Send a DELETE-request
  ///
  /// Sends a DELETE-request on provided [url] with [params].
  delete(String url, {Map<String, dynamic> params = const {}}) {
    return this._instance.delete(url, queryParameters: params);
  }
}

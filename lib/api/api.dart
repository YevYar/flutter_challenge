import 'package:dio/dio.dart';
import 'package:flutter_challenge/constants/constants.dart';
import 'package:flutter_challenge/services/services.dart';
import 'package:flutter_challenge/utils/utils.dart';

import 'models/models.dart';

final _interceptor = InterceptorsWrapper(
  /// In the result of the execution of the onResponse function
  /// response [data] field will be of SuccessResponse or FailedResponse type
  onResponse: (Response response) async {
    if (response.statusCode == 200 && response.data["Response"] == "True") {
      return SuccessResponse(response.data);
    } else if (response.statusCode == 200 &&
        response.data["Response"] == "False") {
      // print("FAILED 1");
      return FailedResponse(
        response.data["Error"],
        statusCode: response.statusCode,
      );
    }
  },
  /// In the result of the execution of the onError function
  /// response error will be of FailedResponse type
  onError: (DioError e) async {
    if (e.response != null) {
      // print("FAILED 2");
      return FailedResponse(
        e.response.statusMessage,
        statusCode: e.response.statusCode,
      );
    } else {
      // print("FAILED 3");
      return FailedResponse(e.message, isResponseNull: true);
    }
  }
);

class Api {
  static final Api instance = Api._privateConstructor();

  HTTPService _httpService = HTTPService(interceptor: _interceptor);

  Api._privateConstructor();

  /// Returns more movies search by [title] results
  ///
  /// Can return SearchOkResponse or FailedResponse
  Future<dynamic> fetchMoreMovie(String title, int page) async {
    Response response = await _httpService.get('${ApiUrl["fetchMore"]}$title&page=$page', params: params);
    return searchUtil(response);
  }

  /// Returns movie by [id]
  ///
  /// Can return FailedResponse
  Future<dynamic> fetchMovie(String id) async {
    Response response = await _httpService.get('${ApiUrl["fetchMovie"]}$id&plot=full', params: params);
    return fetchMovieUtil(response);
  }

  /// Returns movies search by [title] results
  ///
  /// Can return SearchOkResponse or FailedResponse
  Future<dynamic> getSearchResult(String title) async {
    Response response = await _httpService.get('${ApiUrl["search"]}$title', params: params);
    return searchUtil(response);
  }
}

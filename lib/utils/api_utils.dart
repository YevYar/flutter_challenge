import 'package:dio/dio.dart';
import 'package:flutter_challenge/api/models/models.dart';

searchUtil(Response response) {
  if (response.data is SuccessResponse) {
    print('data: ${(response.data as SuccessResponse).data}');

    return SearchOkResponse(
      (response.data.data["Search"] as List<dynamic>).cast<Map<String, String>>(),
      int.parse(response.data.data["totalResults"]));
  } else
    return (response.data as FailedResponse);
}

fetchMovieUtil(Response response) {

}

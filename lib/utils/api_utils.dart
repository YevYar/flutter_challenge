import 'package:dio/dio.dart';
import 'package:flutter_challenge/api/models/models.dart';
import 'package:flutter_challenge/redux/movies/models/models.dart';

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
  if (response.data is SuccessResponse) {
    print('data: ${(response.data as SuccessResponse).data}');

    Map<String, dynamic> data = response.data.data;

    return MovieDetailing(
        genre: data["Genre"],
        director: data["Director"],
        fullPlot: data["Plot"],
        cast: data["Actors"],
        ratings: (data["Ratings"] as List).map((item) => Rating(
              item["Source"],
              item["Value"],
            )).toList()
        );
  } else
    return (response.data as FailedResponse);
}

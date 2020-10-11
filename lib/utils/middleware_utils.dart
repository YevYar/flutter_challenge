import 'package:dio/dio.dart';
import 'package:flutter_challenge/api/models/models.dart';
import 'package:flutter_challenge/constants/constants.dart';
import 'package:flutter_challenge/redux/movies/models/models.dart';
import 'package:flutter_challenge/redux/movies/selectors.dart';
import 'package:meta/meta.dart';
import 'package:redux_saga/redux_saga.dart';

/// Handle responses with statusCode = 200
/// 
/// Executes needed actions on response with statusCode = 200 success or fail.
/// [response] can be IOkResponse or FailedResponse.
/// [onSuccess] is Iterable Function(IOkResponse apiResponse).
Iterable successResponseHandler({
  @required dynamic response,
  @required dynamic onSuccess,
  @required Iterable Function(FailedResponse apiResponse) onFailed,
}) sync* {
  print("successResponseHandler");
  
  if (response is IOkResponse) {
    yield Fork(onSuccess, args: [response]);
  } else if (response is FailedResponse) {
    if (response.statusCode == 200) {
      print("Response failed with statusCode 200");
      yield Fork(onFailed, args: [response]);
    }
  }
}

/// Handle failed responses
/// 
/// Executes needed actions on failed response.
Iterable failedResponseHandler({
  @required dynamic error,
  @required Function(String errorMessage) onError,
}) sync* {
  print("failedResponseHandler");

  if (error is DioError && error.error is FailedResponse) {
    final FailedResponse response = error.error;

    if (!response.isResponseNull && response.statusCode != null) {
      print(
          "Response failed with error and statusCode: ${response.errorMessage}");
      // displayInfo(networkErrorHandler(response), errors.infoTitle);
      yield Put(onError(""));
    } else {
      print("Response failed with error: ${response.errorMessage}");
      // displayInfo((error as Error).message, errors.infoTitle);
      yield Put(onError(""));
    }
  } else {
    // TODO: or display message because FetchMovieFailedAction doesn't use this error
    print("another error");
    yield Put(onError(errors["infoTitle"]));
  }
}

/// Needed actions on search fail
/// 
/// Return Iterable Function.
Function onSearchFailed(Function(String errorMessage) failed) {
  return ((FailedResponse response) sync* {
    yield Put(failed(response.errorMessage ?? ""));
  });
}

/// Needed actions on search success
/// 
/// Return Iterable Function.
Function onSearchSuccess(
  Function(List<Movie> movies, bool isThatsAll) success
) {
  return ((SearchOkResponse response) sync* {
    final movies = response.data
        .map((item) =>
            Movie(item["imdbID"], item["Title"], poster: item["Poster"]))
        .toList();

    final currentMovies = Result<List<Movie>>();
    yield Select(selector: getMovies, result: currentMovies);

    final isThatsAll =
        currentMovies.value.length + movies.length == response.totalResults;

    yield Put(success(movies, isThatsAll));
  });
}

/// Needed actions on fetching movie fail
/// 
/// Return Iterable Function.
Function onFetchMovieFailed(Function failed) {
  return ((FailedResponse response) sync* {
    yield Put(failed());
    // displayInfo(errors.infoDescription + (response.data as ErrorResponse).Error, errors.infoTitle);
  });
}

/// Needed actions on fetching movie success
/// 
/// Return Iterable Function.
Function onFetchMovieSuccess(Function(MovieDetailing) success) {
  return ((MovieOkResponse response) sync* {
    yield Put(success(response.details));
  });
}

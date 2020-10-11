import 'package:flutter_challenge/api/api.dart';
import 'package:flutter_challenge/utils/utils.dart';
import 'package:redux_saga/redux_saga.dart';

import 'actions.dart';
import 'models/models.dart';
import 'selectors.dart';

Iterable _onFetchMore({dynamic action}) sync* {
  yield Try(() sync* {
    print("onFetchMore MIDDLEWARE");

    final title = Result<String>();
    yield Select(selector: getCurrentSearchTitle, result: title);
    final nextPage = Result<int>();
    yield Select(selector: getNextSearchPage, result: nextPage);

    final response = Result();
    yield Call(Api.instance.fetchMoreMovie,
        args: [title.value, nextPage.value], result: response);

    yield Fork(successResponseHandler, namedArgs: {
      Symbol("response"): response.value,
      Symbol("onSuccess"): onSearchSuccess(
          (movies, isThatsAll) => FetchMoreSuccessAction(movies, isThatsAll)),
      Symbol("onFailed"):
          onSearchFailed((errorMessage) => FetchMoreFailedAction(errorMessage)),
    });
  }, Catch: (error) sync* {
    print("onFetchMore middleware error: " + error.toString());

    yield Fork(failedResponseHandler, namedArgs: {
      Symbol("error"): error,
      Symbol("onError"): (String errorMessage) =>
          FetchMoreFailedAction(errorMessage)
    });
  });
}

Iterable _onSearch({dynamic action}) sync* {
  yield Try(() sync* {
    print("onSearch MIDDLEWARE");

    final response = Result();
    yield Call(Api.instance.getSearchResult,
        args: [action.title], result: response);

    yield Fork(successResponseHandler, namedArgs: {
      Symbol("response"): response.value,
      Symbol("onSuccess"): onSearchSuccess(
          (movies, isThatsAll) => SearchSuccessAction(movies, isThatsAll)),
      Symbol("onFailed"):
          onSearchFailed((errorMessage) => SearchFailedAction(errorMessage)),
    });
  }, Catch: (error) sync* {
    print("onSearch middleware error: " + error.toString());

    yield Fork(failedResponseHandler, namedArgs: {
      Symbol("error"): error,
      Symbol("onError"): (String errorMessage) =>
          SearchFailedAction(errorMessage)
    });
  });
}

Iterable _onFetchMovie({dynamic action}) sync* {
  yield Try(() sync* {
    print("onFetchMovie MIDDLEWARE");

    final String id = action.id;

    final currentMovies = Result<List<Movie>>();
    yield Select(selector: getMovies, result: currentMovies);

    final requestedMovie =
        currentMovies.value.firstWhere((item) => item.id == id);

    // this is condition to cancel requesting the movie if it is requested before
    if (requestedMovie.cast.length > 0) {
      yield Put(FetchMovieFailedAction());
      return;
    }

    final response = Result();
    yield Call(Api.instance.fetchMovie, args: [id], result: response);

    yield Fork(successResponseHandler, namedArgs: {
      Symbol("response"): response.value,
      Symbol("onSuccess"): onFetchMovieSuccess(
          (details) => FetchMovieSuccessAction(id, details)),
      Symbol("onFailed"): onFetchMovieFailed((String error) => FetchMovieFailedAction())
    });
  }, Catch: (error) sync* {
    print("onFetchMovie middleware error: " + error.toString());

    yield Fork(failedResponseHandler, namedArgs: {
      Symbol("error"): error,
      Symbol("onError"): (String error) => FetchMovieFailedAction()
    });
  });
}

moviesMiddleware() sync* {
  yield TakeLatest(_onFetchMore, pattern: FetchMoreAction);
  yield TakeLatest(_onSearch, pattern: FindMoviesAction);
  yield TakeLatest(_onFetchMovie, pattern: FetchMovieAction);
}

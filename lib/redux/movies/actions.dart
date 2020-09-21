import 'models/models.dart';

class FindMoviesAction {
  final String title;

  const FindMoviesAction(this.title);

  @override
  String toString() {
    return 'FindMoviesAction{title: $title}';
  }
}

class SearchSuccessAction {
  final List<Movie> movies;
  final bool isThatsAll;

  const SearchSuccessAction(this.movies, this.isThatsAll);

  @override
  String toString() {
    return 'SearchSuccessAction{movies: $movies, isThatsAll: $isThatsAll}';
  }
}

class SearchFailedAction {
  final String errorMessage;

  const SearchFailedAction(this.errorMessage);

  @override
  String toString() {
    return 'SearchFailedAction{errorMessage: $errorMessage}';
  }
}

class FetchMoreAction {}

class FetchMoreSuccessAction {
  final List<Movie> movies;
  final bool isThatsAll;

  const FetchMoreSuccessAction(this.movies, this.isThatsAll);

  @override
  String toString() {
    return 'FetchMoreSuccessAction{movies: $movies, isThatsAll: $isThatsAll}';
  }
}

class FetchMoreFailedAction {
  final String errorMessage;

  const FetchMoreFailedAction(this.errorMessage);

  @override
  String toString() {
    return 'FetchMoreFailedAction{errorMessage: $errorMessage}';
  }
}

class FetchMovieAction {
  final String id;

  const FetchMovieAction(this.id);

  @override
  String toString() {
    return 'FetchMovieAction{id: $id}';
  }
}

class FetchMovieSuccessAction {
  final String id;
  final MovieDetailing detailedInfo;
  
  const FetchMovieSuccessAction(this.id, this.detailedInfo);
  
  @override
  String toString() {
    return 'FetchMovieSuccessAction{id: $id, detailedInfo: $detailedInfo}';
  }
}

class FetchMovieFailedAction {}
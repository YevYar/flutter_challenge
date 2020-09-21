import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'movie.dart';

@immutable
class MovieState {
  final String currentSearchTitle;
  final List<Movie> foundMovies;
  final bool isFetchingMore;
  final bool isFetchingMovie;
  final bool isSearching;
  final bool isThatsAll; // indicates that not fetched movies are on the server on our response
  final int nextSearchPage; // next page, which will be updated only on FETCH_MORE_SUCCESS or will be set to 2 on new search
  final String searchErrorMessage; // For example, "Too many results." / "Movie not found!"

  const MovieState({
    this.currentSearchTitle = "",
    this.foundMovies = const [],
    this.isFetchingMore = false,
    this.isFetchingMovie = false,
    this.isSearching = false,
    this.isThatsAll = false,
    this.nextSearchPage = 2, // can be [1-100] (from API). First page will be returned by search request, so it must be equal 2 for fetch more request
    this.searchErrorMessage = ""
  });

  MovieState copyWith({
    String currentSearchTitle,
    List<Movie> foundMovies,
    bool isFetchingMore,
    bool isFetchingMovie,
    bool isSearching,
    bool isThatsAll,
    int nextSearchPage,
    String searchErrorMessage
  }) {
    return MovieState(
      currentSearchTitle: currentSearchTitle ?? this.currentSearchTitle,
      foundMovies: foundMovies ?? this.foundMovies,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
      isFetchingMovie: isFetchingMovie ?? this.isFetchingMovie,
      isSearching: isSearching ?? this.isSearching,
      isThatsAll: isThatsAll ?? this.isThatsAll,
      nextSearchPage: nextSearchPage ?? this.nextSearchPage,
      searchErrorMessage: searchErrorMessage ?? this.searchErrorMessage
    );
  }

  @override
  int get hashCode =>
      currentSearchTitle.hashCode ^
      foundMovies.hashCode ^
      isFetchingMore.hashCode ^
      isFetchingMovie.hashCode ^
      isSearching.hashCode ^
      isThatsAll.hashCode ^
      nextSearchPage.hashCode ^
      searchErrorMessage.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is MovieState &&
          runtimeType == other.runtimeType &&
          currentSearchTitle == other.currentSearchTitle &&
          listEquals(foundMovies, other.foundMovies) &&
          isFetchingMore == other.isFetchingMore &&
          isFetchingMovie == other.isFetchingMovie &&
          isSearching == other.isSearching &&
          isThatsAll == other.isThatsAll &&
          nextSearchPage == other.nextSearchPage &&
          searchErrorMessage == other.searchErrorMessage;

  @override
  String toString() {
    return '''MovieState{
      currentSearchTitle: $currentSearchTitle,
      foundMovies: $foundMovies,
      isFetchingMore: $isFetchingMore,
      isFetchingMovie: $isFetchingMovie,
      isSearching: $isSearching,
      isThatsAll: $isThatsAll,
      nextSearchPage: $nextSearchPage,
      searchErrorMessage: $searchErrorMessage
    }''';
  }
}
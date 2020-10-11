import 'package:redux/redux.dart';

import 'actions.dart';
import 'models/models.dart';

final _findMoviesReducer = (MovieState state, FindMoviesAction action) =>
    state.copyWith(
        isFetchingMore: false,
        isSearching: true,
        isThatsAll: true,
        currentSearchTitle: action.title,
        foundMovies: [],
        searchErrorMessage: "",
        nextSearchPage: 2);

final _searchSuccessReducer = (MovieState state, SearchSuccessAction action) =>
    state.copyWith(
        isSearching: false,
        foundMovies: action.movies,
        isThatsAll: action.isThatsAll);

final _searchFailedReducer = (MovieState state, SearchFailedAction action) =>
    state.copyWith(
        isSearching: false,
        isThatsAll: true,
        searchErrorMessage: action.errorMessage);

final _fetchMoreReducer = (MovieState state, FetchMoreAction action) =>
    state.copyWith(isFetchingMore: true, searchErrorMessage: "");

final _fetchMoreSuccessReducer =
    (MovieState state, FetchMoreSuccessAction action) => state.copyWith(
          isFetchingMore: false,
          foundMovies: List.from(state.foundMovies)..addAll(action.movies),
          nextSearchPage: state.nextSearchPage + 1,
          isThatsAll: action.isThatsAll,
        );

final _fetchMoreFailedReducer =
    (MovieState state, FetchMoreFailedAction action) => state.copyWith(
        isFetchingMore: false, searchErrorMessage: action.errorMessage);

final _fetchMovieReducer = (MovieState state, FetchMovieAction action) =>
    state.copyWith(isFetchingMovie: true);

final _fetchMovieSuccessReducer =
    (MovieState state, FetchMovieSuccessAction action) => state.copyWith(
          isFetchingMovie: false,
          foundMovies: state.foundMovies
              .map((item) => item.id == action.id
                  ? item.copyWith(action.detailedInfo)
                  : item)
              .toList(),
        );

final _fetchMovieFailedReducer =
    (MovieState state, FetchMovieFailedAction action) =>
        state.copyWith(isFetchingMovie: false);

final Reducer<MovieState> moviesReducer = combineReducers([
  new TypedReducer<MovieState, FindMoviesAction>(_findMoviesReducer),
  new TypedReducer<MovieState, SearchSuccessAction>(_searchSuccessReducer),
  new TypedReducer<MovieState, SearchFailedAction>(_searchFailedReducer),
  new TypedReducer<MovieState, FetchMoreAction>(_fetchMoreReducer),
  new TypedReducer<MovieState, FetchMoreSuccessAction>(
      _fetchMoreSuccessReducer),
  new TypedReducer<MovieState, FetchMoreFailedAction>(_fetchMoreFailedReducer),
  new TypedReducer<MovieState, FetchMovieAction>(_fetchMovieReducer),
  new TypedReducer<MovieState, FetchMovieSuccessAction>(
      _fetchMovieSuccessReducer),
  new TypedReducer<MovieState, FetchMovieFailedAction>(
      _fetchMovieFailedReducer),
]);

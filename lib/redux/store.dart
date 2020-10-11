import 'package:redux/redux.dart';
import 'package:redux_saga/redux_saga.dart';

import 'movies/models/models.dart';
import 'movies/movies.dart';

Store<MovieState> configureStore() {
  var sagaMiddleware = createSagaMiddleware();

  var store = Store<MovieState>(moviesReducer,
      initialState: MovieState(),
      middleware: [applyMiddleware(sagaMiddleware)]);

  sagaMiddleware.setStore(store);
  sagaMiddleware.run(moviesMiddleware);

  return store;
}

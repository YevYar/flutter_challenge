import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/movies/models/models.dart';
import 'redux/redux.dart';
import 'routes/router.gr.dart';

void main() {
  runApp(MyApp(store: configureStore()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Store<MovieState> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<MovieState>(
        // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
        // Widgets will find and use this value as the `Store`.
        store: store,
        child: MaterialApp(
          title: 'Flutter Challenge',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          builder: ExtendedNavigator.builder<Router>(
            router: Router(),
            initialRoute: Routes.searchScreen,
          ),
        ));
  }
}

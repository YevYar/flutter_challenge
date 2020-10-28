import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/api/api.dart';
import 'package:flutter_challenge/redux/movies/models/models.dart';
import 'package:flutter_challenge/redux/movies/movies.dart';
import 'package:flutter_challenge/routes/router.gr.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: StoreConnector<MovieState, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          return () => store.dispatch(FindMoviesAction("fgdgghfdhfh"));
        },
        builder: (context, callback) {
          return RaisedButton(child: const Text("Search"), onPressed: callback);
        },
      ),
      floatingActionButton: StoreConnector<MovieState, VoidCallback>(
        converter: (store) {
          // Return a `VoidCallback`, which is a fancy name for a function
          // with no parameters. It only dispatches an Increment action.
          return () => store.dispatch(FetchMovieAction(""));
        },
        builder: (context, callback) {
          return FloatingActionButton(onPressed: callback);
        },
      ),
      /*RaisedButton(
        child: const Text("Go to Movie"),
        onPressed: () async => print(await Api.instance.fetchMovie("tt0480249")), // .then((value) => print(value)); // ExtendedNavigator.root.pushMovieScreen(),
      )*/
    );
  }
}

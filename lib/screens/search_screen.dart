import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/routes/router.gr.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: RaisedButton(
        child: const Text("Go to Movie"),
        onPressed: () => ExtendedNavigator.root.pushMovieScreen(),
      )
    );
  }
}

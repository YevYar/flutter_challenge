import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie"),
      ),
      body: RaisedButton(
        child: const Text("Go to Search"),
        onPressed: () => ExtendedNavigator.root.pop(),
      )
    );
  }
}

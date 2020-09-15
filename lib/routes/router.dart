
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_challenge/screens/movie_screen.dart';
import 'package:flutter_challenge/screens/search_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SearchScreen, initial: true),
    CupertinoRoute(page: MovieScreen, path: "movie"),
  ])
class $Router {}
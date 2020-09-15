// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/movie_screen.dart';
import '../screens/search_screen.dart';

class Routes {
  static const String searchScreen = '/';
  static const String movieScreen = 'movie';
  static const all = <String>{
    searchScreen,
    movieScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.searchScreen, page: SearchScreen),
    RouteDef(Routes.movieScreen, page: MovieScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SearchScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchScreen(),
        settings: data,
      );
    },
    MovieScreen: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => MovieScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSearchScreen() => push<dynamic>(Routes.searchScreen);

  Future<dynamic> pushMovieScreen() => push<dynamic>(Routes.movieScreen);
}

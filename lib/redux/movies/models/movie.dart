import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
class Movie extends MovieDetailing {
  final String id;
  final String title;
  final String poster; // can be empty

  const Movie(this.id, this.title, {
    this.poster = "",
    String genre = "",
    String director = "",
    String fullPlot = "",
    String cast = "",
    List<Rating> ratings = const []
  }) : super(genre: genre, director: director, fullPlot: fullPlot, cast: cast);

  Movie copyWith(MovieDetailing detailedMovie) {
    return Movie(this.id, this.title,
        poster: this.poster,
        genre: detailedMovie.genre ?? this.genre,
        director: detailedMovie.director ?? this.director,
        fullPlot: detailedMovie.fullPlot ?? this.fullPlot,
        cast: detailedMovie.cast ?? this.cast,
        ratings: detailedMovie.ratings ?? this.ratings);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ poster.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          poster == other.poster &&
          genre == other.genre &&
          director == other.director &&
          fullPlot == other.fullPlot &&
          cast == other.cast &&
          listEquals(ratings, other.ratings);

  @override
  String toString() {
    return '''Movie{
        id: $id,
        title: $title,
        poster: $poster,
        genre: $genre,
        director: $director,
        fullPlot: $fullPlot,
        cast: $cast,
        ratings: $ratings
      }''';
  }
}

@immutable
class MovieDetailing {
  final String genre;
  final String director;
  final String fullPlot;
  final String cast;
  final List<Rating> ratings;

  const MovieDetailing({
    this.genre,
    this.director,
    this.fullPlot,
    this.cast,
    this.ratings
  });
}

@immutable
class Rating {
  final String source;
  final String value;

  const Rating(this.source, this.value);

  @override
  int get hashCode => source.hashCode ^ value.hashCode;

  @override
  bool operator == (Object other) =>
    identical(this, other) ||
    other is Rating &&
        runtimeType == other.runtimeType &&
        source == other.source &&
        value == other.value;

  @override
  String toString() {
    return 'Rating{source: $source, value: $value}';
  }
}

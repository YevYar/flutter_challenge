import 'models/models.dart';

final getCurrentSearchTitle = (MovieState state) => state.currentSearchTitle;

final getMovies = (MovieState state) => state.foundMovies;

final getNextSearchPage = (MovieState state) => state.nextSearchPage;

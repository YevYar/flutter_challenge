import 'package:flutter_challenge/redux/movies/models/models.dart';

import 'responses.dart';

class MovieOkResponse implements IOkResponse {
  final MovieDetailing details;
  
  const MovieOkResponse(this.details);

  @override
  String toString() {
    return 'MovieOkResponse{details: $details}';
  }
}
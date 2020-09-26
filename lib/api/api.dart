import 'package:flutter_challenge/constants/constants.dart';
import 'package:flutter_challenge/services/http.service.dart';

class Api {
  static final Api instance = Api._privateConstructor();

  HTTPService _httpService = HTTPService();

  Api._privateConstructor();
  
  fetchMoreMovie(String title, int page) =>
      _httpService.get('${ApiUrl["fetchMore"]}$title&page=$page', params: params);

  fetchMovie(String id) =>
      _httpService.get('${ApiUrl["fetchMovie"]}$id', params: params);  

  getSearchResult(String title) =>
      _httpService.get('${ApiUrl["search"]}$title', params: params);
}

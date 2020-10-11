import 'responses.dart';

class SearchOkResponse implements IOkResponse {
  final List<Map<String, String>> data;
  final int totalResults;

  const SearchOkResponse(this.data, this.totalResults);

  @override
  String toString() {
    return '''SearchOkResponse{
        data: $data,
        totalResults: $totalResults,
      }''';
  }
}

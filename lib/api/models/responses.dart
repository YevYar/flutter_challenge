class SuccessResponse {
  final Map<String, dynamic> data;

  const SuccessResponse(this.data);

  @override
  String toString() {
    return 'SuccessResponse{data: $data}';
  }
}

class FailedResponse implements Exception {
  final String errorMessage;
  final bool isResponseNull;
  final int statusCode;

  const FailedResponse(this.errorMessage, {this.statusCode, this.isResponseNull = false});

  @override
  String toString() {
    return '''FailedResponse{
        errorMessage: $errorMessage,
        isResponseNull: $isResponseNull,
        statusCode: $statusCode,
      }''';
  }
}

abstract class IOkResponse {}

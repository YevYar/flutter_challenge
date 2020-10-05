class SuccessResponse {
  final Map<String, dynamic> data;

  SuccessResponse(this.data);
}

class FailedResponse implements Exception {
  final String errorMessage;
  final bool isResponseNull;
  final int statusCode;

  FailedResponse(this.errorMessage, {this.statusCode, this.isResponseNull = false});
}

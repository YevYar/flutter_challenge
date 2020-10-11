/// Represents ok response data 
class SuccessResponse {
  final Map<String, dynamic> data;

  const SuccessResponse(this.data);

  @override
  String toString() {
    return 'SuccessResponse{data: $data}';
  }
}

/// Represents failed response
/// 
/// If [statusCode] is presented, [isResponseNull] is false.
/// [isResponseNull] indicates that some error occured in module (for example, host is unavailable).
/// In such situation [statusCode] will be null.
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

/// Interface of handled ok response
abstract class IOkResponse {}

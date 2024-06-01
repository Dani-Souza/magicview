class HttpException implements Exception {
  final String message;
  final int? statusCode;

  HttpException(this.message, {this.statusCode});
  @override
  String toString() {
    if (statusCode != null) {
      return 'HttpException : $message (Status code: $statusCode)';
    }
    return message;
  }
}

class UnauthorizedException extends HttpException {
  UnauthorizedException(super.message) : super(statusCode: 403);
}

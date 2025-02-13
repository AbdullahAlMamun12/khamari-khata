/// A custom exception class to encapsulate error information.
class ErrorEntity implements Exception {
  final int code;
  final String? message;

  ErrorEntity({required this.code, this.message});

  @override
  String toString() {
    return "Exception: code $code, ${message ?? 'Unknown error'}";
  }
}

class AppException implements Exception {
  final String status;
  final String statusMessage;
  final bool success;
  AppException(this.status, this.statusMessage, this.success);
}

class BadRequestException extends AppException {
  BadRequestException(
    super.status,
    super.statusMessage,
    super.success,
  );
}

class FetchDataException extends AppException {
  FetchDataException(
    super.status,
    super.statusMessage,
    super.success,
  );
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(
    super.status,
    super.statusMessage,
    super.success,
  );
}

class NoInternetConnectionException extends AppException {
  NoInternetConnectionException(
      super.status, super.statusMessage, super.success);
}

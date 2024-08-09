/// A base class for handling exceptions in the application.
///
/// [AppException] includes the status, status message, and success flag
/// associated with an API request.
class AppException implements Exception {
  /// The status code returned from the API.
  final String status;

  /// The message associated with the status code.
  final String statusMessage;

  /// A flag indicating whether the API request was successful.
  final bool success;

  /// Creates an [AppException] with the given [status], [statusMessage], and [success].
  AppException(this.status, this.statusMessage, this.success);
}

/// Exception thrown when a bad request (400) is made to the API.
///
/// [BadRequestException] is used to indicate that the request sent by
/// the client was invalid or malformed.
class BadRequestException extends AppException {
  /// Creates a [BadRequestException] with the given [status], [statusMessage], and [success].
  BadRequestException(
    super.status,
    super.statusMessage,
    super.success,
  );
}

/// Exception thrown when there is an error in fetching data from the API.
///
/// [FetchDataException] is used when the client is unable to retrieve
/// data from the server, possibly due to a network error or server issue.
class FetchDataException extends AppException {
  /// Creates a [FetchDataException] with the given [status], [statusMessage], and [success].
  FetchDataException(
    super.status,
    super.statusMessage,
    super.success,
  );
}

/// Exception thrown when the API request is unauthorized (401).
///
/// [UnAuthorizedException] indicates that the client is not authorized
/// to make the API request, possibly due to invalid or missing credentials.
class UnAuthorizedException extends AppException {
  /// Creates an [UnAuthorizedException] with the given [status], [statusMessage], and [success].
  UnAuthorizedException(
    super.status,
    super.statusMessage,
    super.success,
  );
}

/// Exception thrown when there is no internet connection.
///
/// [NoInternetConnectionException] is used to indicate that the client
/// is unable to reach the API due to a lack of network connectivity.
class NoInternetConnectionException extends AppException {
  /// Creates a [NoInternetConnectionException] with the given [status], [statusMessage], and [success].
  NoInternetConnectionException(
    super.status,
    super.statusMessage,
    super.success,
  );
}

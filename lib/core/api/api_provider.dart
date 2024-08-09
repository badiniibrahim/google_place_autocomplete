import 'dart:io';
import 'package:dio/dio.dart';
import 'package:google_place_autocomplete/core/api/api_http_client.dart';
import 'package:google_place_autocomplete/core/api/app_exception.dart';

/// A singleton class responsible for making API requests.
///
/// The [ApiProvider] class handles HTTP requests to various endpoints using the
/// [ApiHttpClient] class. It provides methods for sending GET requests and processes
/// responses to handle errors appropriately.
class ApiProvider {
  /// The single instance of [ApiProvider].
  static ApiProvider? _instance;

  /// The HTTP client used to make API requests.
  late ApiHttpClient httpClient;

  /// Private constructor for creating an instance of [ApiProvider].
  ///
  /// This constructor initializes the [httpClient] with an instance of [ApiHttpClient].
  ApiProvider._() {
    httpClient = ApiHttpClient();
  }

  /// Provides the singleton instance of [ApiProvider].
  ///
  /// This getter returns the single instance of [ApiProvider], creating it if it does not
  /// already exist.
  static ApiProvider get instance {
    _instance ??= ApiProvider._();
    return _instance!;
  }

  /// Sends a GET request to the specified [endpoint].
  ///
  /// - [endpoint]: The API endpoint to which the GET request will be sent.
  /// - [headers]: Optional headers to include in the request.
  /// - [queryParameters]: Optional query parameters to include in the request.
  ///
  /// Returns a [Response] object containing the server's response.
  ///
  /// Throws [UnAuthorizedException] if the response status code is 401 (unauthorized).
  /// Throws [FetchDataException] for any other error response.
  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await httpClient.request(
      endpoint,
      method: "GET",
    );

    return _processResponse(response);
  }

  /// Processes the HTTP response and handles errors.
  ///
  /// - [response]: The HTTP response to process.
  ///
  /// Returns the [Response] object if the status code is 200 (OK).
  /// Throws [UnAuthorizedException] if the response status code is 401.
  /// Throws [FetchDataException] for other error status codes.
  Response _processResponse(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response;

      case HttpStatus.badRequest:

      /// Checking the status code of the response [401].
      case HttpStatus.unauthorized:
        throw UnAuthorizedException(
          response.data['status'] ?? "",
          response.data['status_message'] ?? "",
          response.data['success'] ?? false,
        );

      /// Otherwise, throw an error.
      default:
        throw FetchDataException(
          response.data['error']['code'],
          response.data['error']['description'],
          response.data['success'] ?? false,
        );
    }
  }
}

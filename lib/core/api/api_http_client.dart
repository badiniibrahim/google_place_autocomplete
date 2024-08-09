import 'package:dio/dio.dart';

/// A client for making HTTP requests to the Google Maps API.
///
/// The [ApiHttpClient] class wraps around the [Dio] HTTP client and provides
/// additional configuration and functionality, such as custom headers,
/// timeout settings, and request validation.
class ApiHttpClient {
  /// The default headers used in every request made by this client.
  ///
  /// These headers include a `Content-Type` of `application/json`.
  static get _defaultHeader => {"Content-Type": "application/json"};

  /// An instance of [Dio] configured with base options for making requests.
  ///
  /// The [Dio] client is configured with the base URL for the Google Maps API,
  /// timeout settings, and a header validator that only accepts status codes
  /// below 500.
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://maps.googleapis.com/",
      receiveTimeout: const Duration(milliseconds: 300000),
      connectTimeout: const Duration(milliseconds: 5000),
      headers: _defaultHeader,
      validateStatus: (status) {
        return status! < 500;
      },
    ),
  );

  /// Sends an HTTP request to the specified [path].
  ///
  /// - [path]: The endpoint to which the request is sent, relative to the base URL.
  /// - [body]: The data to be sent as the request body. Defaults to `null`.
  /// - [method]: The HTTP method to be used (e.g., "GET", "POST"). Defaults to `"GET"`.
  /// - [headers]: Optional headers to be added or override the default headers. Defaults to an empty map.
  /// - [queryParameters]: Optional query parameters to be included in the request. Defaults to an empty map.
  /// - [authenticated]: A flag indicating whether the request requires authentication. Defaults to `false`.
  ///
  /// Returns a [Response] object containing the server's response to the HTTP request.
  ///
  /// Example usage:
  /// ```dart
  /// final response = await apiHttpClient.request(
  ///   '/maps/api/place/autocomplete/json',
  ///   queryParameters: {'input': 'Paris', 'key': 'your_api_key'},
  /// );
  /// ```
  Future<Response> request(
    String path, {
    dynamic body,
    String method = "GET",
    Map<String, dynamic>? headers = const {},
    Map<String, dynamic>? queryParameters = const {},
    bool authenticated = false,
  }) async {
    return _dio.request(
      path,
      data: body,
      queryParameters: queryParameters,
    );
  }
}

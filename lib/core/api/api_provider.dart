import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_place_autocomplete/core/api/api_http_client.dart';
import 'package:google_place_autocomplete/core/api/app_exception.dart';

class ApiProvider {
  static ApiProvider? _instance;
  late ApiHttpClient httpClient;

  ApiProvider._() {
    httpClient = ApiHttpClient();
  }

  static ApiProvider get instance {
    _instance ??= ApiProvider._();

    return _instance!;
  }

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

  Response _processResponse(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response;

      case HttpStatus.badRequest:

      /// Checking the status code of the response[401].
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

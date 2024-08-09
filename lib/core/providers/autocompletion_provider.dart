import 'package:dio/dio.dart';
import 'package:google_place_autocomplete/core/api/api_provider.dart';
import 'package:google_place_autocomplete/core/api/i_provider.dart';

/// A provider for handling auto-completion requests to the Google Places API.
///
/// [AutoCompletionProvider] extends [IProvider] and is used to interact with
/// the Google Places API to fetch auto-completion suggestions based on user input.
/// It provides the necessary endpoint and a method to perform the request.
class AutoCompletionProvider extends IProvider<Response> {
  /// The endpoint for the Google Places API auto-completion request.
  ///
  /// This endpoint is used to fetch auto-completion suggestions for a given input term.
  @override
  String get endpoint => "maps/api/place/queryautocomplete/json?input=";

  /// Sends a request to the Google Places API to get auto-completion suggestions.
  ///
  /// - [term]: The input term for which auto-completion suggestions are requested.
  /// - [googleMapApiKey]: The API key for accessing Google Places services.
  /// - [language]: The language code for the suggestions (e.g., 'en' for English, 'fr' for French).
  ///
  /// Returns a [Future] that resolves to a [Response] object containing the API response.
  ///
  /// Throws an exception if the API request fails or if there is a network issue.
  Future<Response> onAutoCompletion(
      String term, String googleMapApiKey, String language) async {
    return await ApiProvider.instance.get(
      endpoint: "$endpoint$term&key=$googleMapApiKey&language=$language",
    );
  }
}

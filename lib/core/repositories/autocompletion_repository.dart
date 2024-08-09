import 'package:dio/dio.dart';
import 'package:google_place_autocomplete/core/api/i_repository.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';
import 'package:google_place_autocomplete/core/providers/autocompletion_provider.dart';

/// A repository class for handling auto-completion data using the [AutoCompletionProvider].
///
/// [AutoCompletionRepository] extends [IRepository] and is responsible for fetching
/// auto-completion suggestions from the Google Places API and converting the response
/// into a [GooglePlaceAutocompleteResponse] model.
class AutoCompletionRepository extends IRepository<Response> {
  /// Provides an instance of [AutoCompletionProvider] for interacting with the API.
  @override
  AutoCompletionProvider get provider => AutoCompletionProvider();

  /// Fetches auto-completion suggestions for a given input term.
  ///
  /// This method sends a request to the Google Places API using the [provider] and
  /// parses the response into a [GooglePlaceAutocompleteResponse] model.
  ///
  /// - [term]: The input term for which auto-completion suggestions are requested.
  /// - [googleMapApiKey]: The API key for accessing Google Places services.
  /// - [language]: The language code for the suggestions (e.g., 'en' for English, 'fr' for French).
  ///
  /// Returns a [Future] that resolves to a [GooglePlaceAutocompleteResponse] object
  /// containing the parsed auto-completion suggestions.
  ///
  /// Throws an exception if the API request fails or if there is an issue parsing the response.
  Future<GooglePlaceAutocompleteResponse> onAutoCompletion(
      String term, String googleMapApiKey, String language) async {
    final response =
        await provider.onAutoCompletion(term, googleMapApiKey, language);
    GooglePlaceAutocompleteResponse autocompletion =
        GooglePlaceAutocompleteResponse.fromJson(response.data);
    return autocompletion;
  }
}

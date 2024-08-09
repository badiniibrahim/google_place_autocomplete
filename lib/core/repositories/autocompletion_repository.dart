import 'package:dio/dio.dart';
import 'package:google_place_autocomplete/core/api/i_repository.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';
import 'package:google_place_autocomplete/core/providers/autocompletion_provider.dart';

class AutoCompletionRepository extends IRepository<Response> {
  @override
  AutoCompletionProvider get provider => AutoCompletionProvider();

  Future<GooglePlaceAutocompleteResponse> onAutoCompletion(
      String term, String googleMapApiKey, String language) async {
    final response =
        await provider.onAutoCompletion(term, googleMapApiKey, language);
    GooglePlaceAutocompleteResponse autocompletion =
        GooglePlaceAutocompleteResponse.fromJson(response.data);
    return autocompletion;
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place_autocomplete/core/api/i_controller.dart';
import 'package:google_place_autocomplete/core/repositories/autocompletion_repository.dart';
import 'package:google_place_autocomplete/state.dart';

/// A controller for managing the Google Place Autocomplete functionality.
///
/// This controller handles user input, fetches autocomplete suggestions from
/// the repository, and updates the state of the autocomplete suggestions.
class GooglePlaceAutocompleteController extends GetxController
    with IController {
  /// A [GlobalKey] used to identify and access the form associated with this controller.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// A [TextEditingController] for managing the input field of the place search.
  final TextEditingController placeFieldController = TextEditingController();

  /// An instance of [AutoCompletionRepository] used to fetch autocomplete suggestions.
  final AutoCompletionRepository _repository = AutoCompletionRepository();

  /// The state object holding the current state of autocomplete suggestions.
  final AutocompletionState state = AutocompletionState();

  /// Disposes of the [TextEditingController] when the controller is closed.
  @override
  void onClose() {
    placeFieldController.dispose();
    super.onClose();
  }

  /// Fetches autocomplete suggestions based on the given search term.
  ///
  /// This method queries the repository for suggestions and updates the state.
  ///
  /// - [term]: The search term entered by the user.
  /// - [googleMapApiKey]: The API key for accessing Google Places API.
  /// - [language]: The language code for the autocomplete suggestions.
  Future<void> onAutoCompletion(
      String term, String googleMapApiKey, String language) async {
    state.isLoading = true;
    try {
      final response =
          await _repository.onAutoCompletion(term, googleMapApiKey, language);

      if (response.status == 'ZERO_RESULTS') {
        // No results were found for the given term
        state.autocompletionList = [];
      } else if (response.status == 'REQUEST_DENIED') {
        // Handle request denial if necessary
        if (kDebugMode) {
          print('Request denied: ${response.error}');
        }
      } else {
        // Update the state with the list of predictions
        state.autocompletionList = response.predictions;
      }
    } catch (e) {
      // Log the error if debugging
      if (kDebugMode) {
        print('Error during autocomplete: $e');
      }
    } finally {
      // Always set loading to false after the request completes
      state.isLoading = false;
    }
  }
}

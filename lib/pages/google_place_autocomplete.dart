import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place_autocomplete/controller/google_place_autocomplete_controller.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';
import 'package:google_place_autocomplete/widgets/location_list_tile.dart';
import 'package:google_place_autocomplete/widgets/text_form_field.dart';

/// This widget provides a Google Place Autocomplete feature using the Google Places API.
class GooglePlaceAutocomplete
    extends GetView<GooglePlaceAutocompleteController> {
  /// Constructor for GooglePlaceAutocomplete widget.
  ///
  /// [googleMapApiKey] is required for accessing the Google Places API.
  /// [language] is an optional parameter to specify the language for the autocomplete suggestions.
  /// Defaults to 'fr' for French.
  /// [onPredictionSelected] is a required callback function that is invoked when a prediction is selected.
  /// [loadingText] is an optional parameter to specify the text shown while loading.
  /// Defaults to 'Loading...'.
  const GooglePlaceAutocomplete({
    super.key,
    required this.googleMapApiKey, // API key for Google Maps services.
    this.language =
        'fr', // Optional language parameter with a default value of 'fr'.
    required this.onPredictionSelected, // Required callback for handling prediction selection.
    this.loadingText =
        'Loading...', // Optional loading text with a default value.
  });

  /// API key for Google Maps services.
  final String googleMapApiKey;

  /// Language code for autocomplete suggestions (e.g., 'en' for English, 'fr' for French).
  /// Defaults to 'fr'.
  final String language;

  /// Callback function that is triggered when a prediction is selected.
  final Function(Prediction) onPredictionSelected;

  /// Text displayed while loading the autocomplete suggestions.
  final String loadingText;

  @override
  Widget build(BuildContext context) {
    // Obtain the controller instance
    final controller = Get.put(GooglePlaceAutocompleteController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Column(
          children: [
            // Custom text form field for entering the location query
            Center(
              child: CustomTextFormField(
                controller: controller.placeFieldController,
                onChanged: (text) {
                  controller.onAutoCompletion(text, googleMapApiKey, language);
                  // Pass the API key and language parameter to the controller when triggering autocomplete
                },
              ),
            ),
            const Divider(height: 2, thickness: 2, color: Color(0xFFF8F8F8)),
            // Observe changes in the autocomplete list and update the view
            Obx(() => _buildView(controller))
          ],
        ),
      ),
    );
  }

  /// Builds the main view depending on the state of the controller.
  Widget _buildView(GooglePlaceAutocompleteController controller) {
    // Display a loading text when data is being fetched
    if (controller.state.isLoading) {
      return Center(
        child: Text(
          loadingText, // Use the provided loading text
          style: const TextStyle(
            fontFamily: 'Merriweather',
          ),
        ),
      );
    }

    // Display the list of autocomplete suggestions
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
      itemCount: controller.state.autocompletionList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => SingleChildScrollView(
        child: Center(
          child: LocationListTile(
            prediction: controller.state.autocompletionList[index],
            onPredictionSelected: (selectedPrediction) {
              onPredictionSelected(selectedPrediction);
              // Trigger the provided callback when a prediction is selected
            },
          ),
        ),
      ),
    );
  }
}

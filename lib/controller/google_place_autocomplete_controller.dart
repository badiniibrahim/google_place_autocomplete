import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place_autocomplete/core/api/i_controller.dart';
import 'package:google_place_autocomplete/core/repositories/autocompletion_repository.dart';
import 'package:google_place_autocomplete/state.dart';

class GooglePlaceAutocompleteController extends GetxController
    with IController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController placeFieldController = TextEditingController();
  final AutoCompletionRepository _repository = AutoCompletionRepository();
  final AutocompletionState state = AutocompletionState();

  @override
  void onClose() {
    placeFieldController.dispose();
    super.onClose();
  }

  Future<void> onAutoCompletion(
      String term, String googleMapApiKey, String language) async {
    state.isLoading = true;
    try {
      final response =
          await _repository.onAutoCompletion(term, googleMapApiKey, language);

      if (response.status == 'ZERO_RESULTS') {
        state.autocompletionList = [];
      } else if (response.status == 'REQUEST_DENIED') {
      } else {
        state.autocompletionList = response.predictions;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erreur lors de l\'auto-complétion: $e');
      }
    } finally {
      state.isLoading = false;
    }
  }
}

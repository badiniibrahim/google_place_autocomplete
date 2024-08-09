import 'package:get/get.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';

/// A state management class for handling the state of auto-completion results.
///
/// The [AutocompletionState] class manages the loading state and the list of
/// auto-completion suggestions. It uses reactive programming with the GetX
/// package to update and observe changes in the state.
class AutocompletionState {
  /// A reactive boolean value indicating whether data is currently being loaded.
  ///
  /// When [isLoading] is true, it means that data fetching is in progress.
  /// When false, data loading is complete or not in progress.
  final RxBool _isLoading = RxBool(false);

  /// Sets the loading state.
  ///
  /// - [value]: The new loading state to be set.
  set isLoading(value) => _isLoading.value = value;

  /// Gets the current loading state.
  ///
  /// Returns a boolean indicating whether data is currently being loaded.
  bool get isLoading => _isLoading.value;

  /// A reactive list of [Prediction] objects representing the auto-completion suggestions.
  ///
  /// This list contains the suggestions returned from the auto-completion API.
  final RxList<Prediction> _autocompletionList = <Prediction>[].obs;

  /// Sets the list of auto-completion suggestions.
  ///
  /// - [value]: The new list of [Prediction] objects to be set.
  set autocompletionList(value) => _autocompletionList.value = value;

  /// Gets the current list of auto-completion suggestions.
  ///
  /// Returns a list of [Prediction] objects representing the suggestions.
  List<Prediction> get autocompletionList => _autocompletionList;
}

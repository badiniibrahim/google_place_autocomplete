import 'package:get/get.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';

class AutocompletionState {
  // isLoading
  final RxBool _isLoading = RxBool(false);
  set isLoading(value) => _isLoading.value = value;
  bool get isLoading => _isLoading.value;

  final RxList<Prediction> _autocompletionList = <Prediction>[].obs;
  set autocompletionList(value) => _autocompletionList.value = value;
  List<Prediction> get autocompletionList => _autocompletionList;
}

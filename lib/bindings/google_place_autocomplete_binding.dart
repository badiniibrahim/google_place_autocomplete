import 'package:get/instance_manager.dart';
import 'package:google_place_autocomplete/controller/google_place_autocomplete_controller.dart';

class GooglePlaceAutocompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GooglePlaceAutocompleteController>(
        () => GooglePlaceAutocompleteController());
  }
}

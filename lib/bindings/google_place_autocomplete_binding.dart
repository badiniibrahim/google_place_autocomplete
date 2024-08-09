import 'package:get/instance_manager.dart';
import 'package:google_place_autocomplete/controller/google_place_autocomplete_controller.dart';

/// A class responsible for binding the [GooglePlaceAutocompleteController] to the dependency injection system.
///
/// This class ensures that the [GooglePlaceAutocompleteController] is lazily instantiated and
/// available for injection throughout the application.
class GooglePlaceAutocompleteBinding extends Bindings {
  /// The method used to define and register the dependencies for this binding.
  ///
  /// It will create an instance of [GooglePlaceAutocompleteController] and
  /// register it with the [GetX] dependency injection system. The instance will be lazily
  /// instantiated, meaning it will only be created when it is first requested.
  @override
  void dependencies() {
    Get.lazyPut<GooglePlaceAutocompleteController>(
        () => GooglePlaceAutocompleteController());
  }
}

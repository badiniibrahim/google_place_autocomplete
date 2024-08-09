import 'package:get/get.dart';
import 'package:google_place_autocomplete/core/api/app_exception.dart';

/// A mixin for enhancing [GetxController] with additional error handling functionality.
///
/// The [IController] mixin provides a method to perform actions with built-in error handling
/// and a method to handle specific types of exceptions.
mixin IController on GetxController {
  /// Executes an action with error handling and an optional callback.
  ///
  /// The [actionPerform] method attempts to execute the given [action] function. If an
  /// [AppException] is thrown during the execution of the action, the exception is caught
  /// and passed to the [handleError] method for further processing. After the action is
  /// performed, an optional [callback] function is executed.
  ///
  /// - [action]: The main function to be executed. This function is required.
  /// - [callback]: An optional function that will be executed after the action is performed,
  ///   regardless of whether an exception was thrown.
  void actionPerform({required Function action, Function? callback}) async {
    try {
      await action.call();
    } on AppException catch (e) {
      handleError(e);
    } finally {
      await callback?.call();
    }
  }

  /// Handles errors based on the type of exception.
  ///
  /// The [handleError] method checks if the [error] is of type [UnAuthorizedException].
  /// If it is, the method returns `true` indicating that the error was handled.
  /// For all other types of errors, the method returns `false`.
  ///
  /// - [error]: The error to be processed.
  /// - Returns: `true` if the error is an [UnAuthorizedException], `false` otherwise.
  bool handleError(error) {
    if (error is UnAuthorizedException) {
      return true;
    }

    return false;
  }
}

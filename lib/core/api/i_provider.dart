/// An abstract class that defines a contract for API providers.
///
/// The [IProvider] class is used as a base class for API providers that
/// interact with different endpoints. It requires subclasses to implement
/// a `get` method that provides the endpoint URL for the API resource.
abstract class IProvider<T> {
  /// The API endpoint that this provider interacts with.
  ///
  /// Subclasses must override this getter to return the specific API endpoint
  /// as a [String].
  String get endpoint;
}

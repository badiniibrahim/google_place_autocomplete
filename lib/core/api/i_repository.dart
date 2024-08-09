import 'package:google_place_autocomplete/core/api/i_provider.dart';

/// An abstract class that defines a contract for repositories.
///
/// The [IRepository] class serves as a base for repositories that manage
/// data access through a specific provider. It requires subclasses to
/// implement a getter that provides an instance of [IProvider] which
/// handles API requests and endpoint management.
abstract class IRepository<T> {
  /// The provider that this repository uses for data access.
  ///
  /// Subclasses must override this getter to return an instance of [IProvider<T>].
  /// This provider handles the communication with the API and manages the
  /// endpoint URL for data operations.
  IProvider<T> get provider;
}

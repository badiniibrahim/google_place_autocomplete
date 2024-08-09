import 'package:google_place_autocomplete/core/api/i_provider.dart';

abstract class IRepository<T> {
  IProvider<T> get provider;
}

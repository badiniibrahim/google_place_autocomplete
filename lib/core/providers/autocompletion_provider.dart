import 'package:dio/dio.dart';
import 'package:google_place_autocomplete/core/api/api_provider.dart';
import 'package:google_place_autocomplete/core/api/i_provider.dart';

class AutoCompletionProvider extends IProvider<Response> {
  @override
  String get endpoint => "maps/api/place/queryautocomplete/json?input=";

  Future<Response> onAutoCompletion(
      String term, String googleMapApiKey, String language) async {
    return await ApiProvider.instance.get(
      endpoint: "$endpoint$term&key=$googleMapApiKey&language=$language",
    );
  }
}

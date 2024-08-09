import 'package:flutter/material.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';
import 'package:google_place_autocomplete/pages/google_place_autocomplete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GooglePlaceAutocomplete(
        googleMapApiKey: '',
        onPredictionSelected: (prediction) =>
            {onPredictionSelected(prediction)},
      ),
    );
  }

  void onPredictionSelected(Prediction prediction) {}
}

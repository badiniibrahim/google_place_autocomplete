import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_place_autocomplete/controller/google_place_autocomplete_controller.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';
import 'package:google_place_autocomplete/pages/google_place_autocomplete.dart';
import 'package:google_place_autocomplete/widgets/location_list_tile.dart';
import 'package:google_place_autocomplete/widgets/text_form_field.dart';
import 'package:mockito/mockito.dart';

class MockGooglePlaceAutocompleteController extends Mock
    implements GooglePlaceAutocompleteController {}

void main() {
  late MockGooglePlaceAutocompleteController controller;
  const apiKey = 'test_api_key';

  setUp(() {
    controller = MockGooglePlaceAutocompleteController();
  });

  Widget createWidgetUnderTest() {
    return GetMaterialApp(
      home: GooglePlaceAutocomplete(
        googleMapApiKey: apiKey,
        onPredictionSelected: (Prediction prediction) {},
      ),
    );
  }

  testWidgets('Displays the text field for input', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    expect(find.byType(CustomTextFormField), findsOneWidget);
  });

  testWidgets('Displays loading text when the state is isLoading',
      (WidgetTester tester) async {
    when(controller.state.isLoading).thenReturn(true);
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Loading...'), findsOneWidget);
  });

  testWidgets('Displays predictions when they are available',
      (WidgetTester tester) async {
    when(controller.state.isLoading).thenReturn(false);
    when(controller.state.autocompletionList).thenReturn([
      Prediction(description: 'Paris', placeId: '123'),
      Prediction(description: 'Lyon', placeId: '456'),
    ]);
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(LocationListTile), findsNWidgets(2));
    expect(find.text('Paris'), findsOneWidget);
    expect(find.text('Lyon'), findsOneWidget);
  });

  testWidgets(
      'Checks if the onAutoCompletion method is called when typing text',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    final field = find.byType(CustomTextFormField);

    await tester.enterText(field, 'Paris');
    await tester.pump();

    verify(controller.onAutoCompletion('Paris', apiKey, 'fr')).called(1);
  });
}

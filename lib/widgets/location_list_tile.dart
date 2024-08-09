import 'package:flutter/material.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';

/// A widget that displays a location suggestion as a list tile.
///
/// The [LocationListTile] widget is used to show a single location suggestion
/// in a list. It presents the location's description and an icon. When the
/// list tile is tapped, an optional callback function can be triggered to
/// handle the selected location.
///
/// The widget is designed to be used in conjunction with auto-completion
/// results from the Google Places API.
class LocationListTile extends StatelessWidget {
  /// The prediction data to be displayed in the list tile.
  ///
  /// This should contain information about the location suggestion, such as
  /// its description.
  final Prediction prediction;

  /// A callback function that is triggered when the list tile is tapped.
  ///
  /// The function receives the [Prediction] object associated with the tapped
  /// list tile. This is optional and can be used to handle selection events.
  final Function(Prediction)? onPredictionSelected;

  /// Creates a [LocationListTile] widget.
  ///
  /// - [prediction]: The [Prediction] object that contains the data to be
  ///   displayed in the list tile. This parameter is required.
  /// - [onPredictionSelected]: An optional callback function that will be
  ///   called when the list tile is tapped, passing the [Prediction] object
  ///   as an argument.
  const LocationListTile({
    super.key,
    required this.prediction,
    this.onPredictionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            // Trigger the callback function if it's provided
            if (onPredictionSelected != null) {
              onPredictionSelected!(prediction);
            }
          },
          horizontalTitleGap: 0,
          leading: Transform.rotate(
            angle: 45 * 0.02, // Rotate the icon to match the desired appearance
            child: const Icon(
              Icons.navigation,
              size: 20,
              color: Color(0xFF787F84),
            ),
          ),
          title: Text(
            prediction.description ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Merriweather',
            ),
          ),
        ),
        const Divider(height: 2, thickness: 2, color: Color(0xFFF8F8F8)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_place_autocomplete/core/models/google_place_autocomplete.dart';

class LocationListTile extends StatelessWidget {
  final Prediction prediction;
  final Function(Prediction)? onPredictionSelected;

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
            if (onPredictionSelected != null) {
              onPredictionSelected!(prediction);
            }
          },
          horizontalTitleGap: 0,
          leading: Transform.rotate(
            angle: 45 * 0.02,
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

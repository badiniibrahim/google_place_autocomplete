// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

/// A custom text form field widget with optional prefix and change handling.
///
/// The [CustomTextFormField] widget is a customizable text input field designed
/// for use in forms. It supports optional prefix icons, change callbacks, and
/// provides a specific styling for the text field and its decoration.
class CustomTextFormField extends StatelessWidget {
  /// Creates a [CustomTextFormField] widget.
  ///
  /// - [prefix]: An optional widget to be displayed as a prefix icon within the
  ///   text field. This is not used in the current implementation but can be
  ///   extended to add custom prefix icons.
  /// - [onChanged]: An optional callback function that is called when the text
  ///   in the field changes. It provides the current value of the text field.
  /// - [controller]: An optional [TextEditingController] to control the text
  ///   being edited. It allows for programmatic control of the text field's
  ///   value and cursor position.
  CustomTextFormField({
    super.key,
    this.prefix,
    this.onChanged,
    this.controller,
  });

  /// An optional widget to be displayed as a prefix icon within the text field.
  ///
  /// This property can be used to add custom icons or widgets to the start of the
  /// text field. Note: This property is not currently used in the widget.
  final Image? prefix;

  /// An optional callback function that is triggered when the text field's content changes.
  ///
  /// This function provides the new text value as a parameter and can be used to
  /// handle text input dynamically.
  Function(String)? onChanged;

  /// An optional [TextEditingController] to control the text being edited.
  ///
  /// This controller allows for programmatic manipulation of the text field's
  /// content and cursor position.
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 75,
          width: 381,
          child: TextField(
            controller: controller,
            showCursor: true,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.grey,
            textInputAction: TextInputAction.search,
            onChanged: (value) => onChanged?.call(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 2.0, color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 2.0, color: Colors.grey),
              ),
              hintText: "Search your location",
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Merriweather',
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: Icon(Icons.pin_drop_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

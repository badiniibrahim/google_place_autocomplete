// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.prefix,
    this.onChanged,
    this.controller,
  });

  final Image? prefix;
  Function(String)? onChanged;
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

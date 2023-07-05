import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration customInputDecoration({required String hintText}) =>
      InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        counterStyle: const TextStyle(fontSize: 0, color: Colors.transparent),
        isDense: true,
        filled: true,
        hintText: hintText,
        fillColor: Colors.transparent,
      );

  static InputDecoration searchInputDecoration = InputDecoration(
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(24),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(24),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffE0E0E0)),
      borderRadius: BorderRadius.circular(24),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffE0E0E0)),
      borderRadius: BorderRadius.circular(24),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffE0E0E0)),
      borderRadius: BorderRadius.circular(24),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffE0E0E0)),
      borderRadius: BorderRadius.circular(24),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 4,
      vertical: 12,
    ),
    counterStyle: const TextStyle(fontSize: 0, color: Colors.transparent),
    isDense: true,
    filled: true,
    fillColor: Colors.transparent,
  );
}

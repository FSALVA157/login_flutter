import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authDecoration(
      {required String hinttxt, required String labeltxt, IconData? prefix}) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        hintText: hinttxt,
        labelText: labeltxt,
        labelStyle: TextStyle(color: Colors.deepPurple),
        prefixIcon: (prefix != null)
            ? Icon(
                prefix,
                color: Colors.deepPurple,
              )
            : null);
  }
}

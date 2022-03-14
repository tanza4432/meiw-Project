import 'package:flutter/material.dart';
import 'package:hospitel/Theme/theme.dart';

class ThemeHelper {
  InputDecoration textInputDecoration([String hintText = ""]) {
    return InputDecoration(
      filled: true,
      fillColor: ColorBGText,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: BorderSide(width: 0.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 0.0),
        borderRadius: BorderRadius.circular(100.0),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.red, width: 2.0)),
      hintText: hintText,
      labelStyle: TextStyle(
        fontFamily: 'Opun',
        color: Colors.black,
      ),
    );
  }
}

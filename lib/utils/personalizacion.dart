import 'package:flutter/material.dart';

InputDecoration decoration(String labelText, Widget? prefixIcon,
    {Widget? suffixIcon}) {
  return InputDecoration(
    labelStyle: TextStyle(color: colorTextInputLabel),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    counterText: '',
    errorStyle: const TextStyle(color: Colors.red),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: colorLineBorder, width: 1.0),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: colorLinearProgress, width: 1.0),
    ),
    contentPadding:
        const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
    labelText: labelText,
  );
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

const String colorSecondary = '#673AB7'; //Purpura

get colorAppBar => hexToColor('#0B0604');
get colorButtonPrimary => hexToColor('#FFFFFF');
get colorLinearProgress => hexToColor(colorSecondary);
get colorLineBorder => hexToColor('#DDDDDD');
get colorTextButtonPrimary => hexToColor(colorSecondary);
get colorTextInputLabel => hexToColor(colorSecondary);
get colorTextTitle => hexToColor('#0E0525');

get anchoFormulario {
  return 500.0;
}

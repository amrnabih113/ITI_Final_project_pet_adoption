import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class MyCheckboxTheme {
  MyCheckboxTheme._();

  static final lightCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return MyColors.white;
        }
        return MyColors.black;
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return MyColors.primaryColor;
        }
        return Colors.transparent;
      }));

  static final darkCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return MyColors.white;
        }
        return MyColors.white;
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return MyColors.primaryColor;
        }
        return Colors.transparent;
      }));
}

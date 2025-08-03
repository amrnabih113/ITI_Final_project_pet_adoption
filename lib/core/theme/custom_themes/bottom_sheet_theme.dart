import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class MyBottomSheetTheme {
  MyBottomSheetTheme._();

  static const lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor:MyColors.white,
    modalBackgroundColor:MyColors.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
  );

  static const darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor:MyColors.black,
    modalBackgroundColor:MyColors.black,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
  );
}

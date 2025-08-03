import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHelperFunctions {
  static Color? getColor(String value) {
    switch (value) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'pink':
        return Colors.pink;
      case 'brown':
        return Colors.brown;
      case 'grey':
        return Colors.grey;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'cyan':
        return Colors.cyan;
      case 'indigo':
        return Colors.indigo;
      case 'teal':
        return Colors.teal;
      default:
        return null;
    }
  }
  static void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void showAlertDialog(String title,String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  } 

  static String truncateText(String text, int maxChars, {endWith = '...'}) {
    if (text.length <= maxChars) {
      return text;
    }
    return text.substring(0, maxChars) + endWith;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size getScreenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

static List<T> removeDuplicates<T>(List<T> list) {
  return list.toSet().toList();
}

static List<Widget> wrapWidgets(List<Widget> widgets ,int rowSize) {
  List<Widget> wrappedWidgets = [];
  for (int i = 0; i < widgets.length; i += rowSize) {
    List<Widget> rowWidgets = widgets.sublist(i, i + rowSize);
    wrappedWidgets.add(Row(
      children: rowWidgets,
    ));
  }
  return wrappedWidgets;
}


}

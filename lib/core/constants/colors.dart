import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  // App basic Colors
  static const Color primaryColor = Color(0xFFFFA726); // Warm Orange
  static const Color secondaryColor = Color(0xFF81D4FA); // Sky Blue
  static const Color accent = Color(0xFFAED581); // Mint Green
  static const Color darker = Color(0xFF616161); // Slate Gray
  static const Color buttonDark = Color(0xFF4F4F4F); // Darker Neutral
  static const Color buttonLight = Color(0xFFF4F4F4); // Light Grey
  static const Color selectedButton = Color(0xFFCE93D8); // Lilac Accent

  // Gradient Colors
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.2, .8],
    colors: [primaryColor, secondaryColor],
  );

  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.5, 1.0],
    colors: [primaryColor, white],
  );

  static LinearGradient customGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [0.0, 0.5, 0.8],
      colors: [color.shade800, color.shade500, color.shade300],
    );
  }

  static LinearGradient customGradient2(Color color) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.5, 0.9],
      colors: [color, white],
    );
  }

  static SweepGradient customSweepGradient(MaterialColor color) {
    return SweepGradient(
      startAngle: 0.0,
      endAngle: 3.14 * 2,
      tileMode: TileMode.clamp,
      colors: [
        color.shade900,
        color.shade700,
        color.shade500,
        color.shade300,
        color.shade100,
      ],
      stops: const [0.2, 0.5, 0.7, 0.9, 1.0],
    );
  }

  static MaterialColor getMaterialColor(String colorHex) {
    final Map<String, MaterialColor> predefinedColors = {
      '#FFA726': Colors.orange,
      '#81D4FA': Colors.lightBlue,
      '#AED581': Colors.lightGreen,
      '#CE93D8': Colors.purple,
      '#616161': Colors.grey,
    };

    if (predefinedColors.containsKey(colorHex.toUpperCase())) {
      return predefinedColors[colorHex.toUpperCase()]!;
    }

    try {
      if (!colorHex.startsWith('#') ||
          (colorHex.length != 7 && colorHex.length != 9)) {
        throw const FormatException('Invalid color format');
      }

      int colorInt = int.parse(colorHex.substring(1), radix: 16);
      int red = (colorInt >> 16) & 0xFF;
      int green = (colorInt >> 8) & 0xFF;
      int blue = colorInt & 0xFF;

      return _createMaterialColor(Color.fromRGBO(red, green, blue, 1));
    } catch (e) {
      return Colors.grey;
    }
  }

  static MaterialColor _createMaterialColor(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color.withAlpha(25),
      100: color.withAlpha(50),
      200: color.withAlpha(75),
      300: color.withAlpha(100),
      400: color.withAlpha(125),
      500: color.withAlpha(150),
      600: color.withAlpha(175),
      700: color.withAlpha(200),
      800: color.withAlpha(225),
      900: color.withAlpha(255),
    });
  }

  // Text Colors
  static const Color textPrimary = Color(0xFF3E3E40);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = const Color.fromARGB(
    255,
    255,
    250,
    240,
  ); // Creamy Beige
  static const Color dark = Color(0xFF232323);
  static const Color primaryBackground = Color(0xFFF9F9F9);

  // Container Backgrounds
  static const Color lightContainer = Color(0xFFF9ECC3);
  static Color darkContainer = const Color(0xFF171E2D);

  // Button Colors
  static const Color primaryButton = primaryColor;
  static const Color secondaryButton = Color(0xFF6C757D);
  static const Color disabledButton = Color(0xFFC4C4C4);

  // Border Colors
  static const Color primaryBorder = Color(0xFFE0E0E0);
  static const Color primaryBorderDark = Color(0xFF37474F);
  static const Color secondaryBorder = Color(0xFFF4F4F4);

  // Status Colors
  static const Color error = Color(0xFFDC3545);
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF17A2B8);

  // Neutral Shades
  static const Color black = Color(0xFF212121);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF9E9E9E);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}

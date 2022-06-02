import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.transparent,
  primaryColor: AppColors.primaryColor,
  fontFamily: 'FiraCode',
);

abstract class StaticData {
  static const headerHeight = 75.0;
}

abstract class AppColors {
  static const background = Color(0xFF14141A);
  static const secondBackgroundColor = Color(0x22143BBF);

  static const footerIconBackground = Color(0xFF27271A);

  static const primaryColor = Color(0xFF945EFF);
  static const secondaryColor = Color(0xFF6666FF);
}

abstract class AppTextStyle {
  static const logoText = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const headerItemText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const errorPageText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const mainPageFirstLine = TextStyle(
    fontSize: 36,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: 'FiraCode',
  );

  static const mainPageSecondLine = TextStyle(
    fontSize: 42,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: 'FiraCode',
  );

  static const mainPageThirdLine = TextStyle(
    fontSize: 34,
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'FiraCode',
  );

  static const pageTitle = TextStyle(
    fontSize: 36,
  );

  static const projectTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const tagTitle = TextStyle(
    fontSize: 12,
    color: Color(0xFFEEEEEE),
  );

  static TextStyle footerText(bool mobile) => TextStyle(
        fontSize: mobile ? 14 : 16,
        fontWeight: FontWeight.w500,
      );
}

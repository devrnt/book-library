import 'package:flutter/material.dart';
import 'package:book_library/src/theme/colors.dart';

class Theme {
  static ThemeData get lightTheme {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      textTheme: _lightTextTheme,
      accentColor: kAccentColor,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kPrimaryColor,
      appBarTheme: _appBarTheme,
      floatingActionButtonTheme: _fabTheme,
      errorColor: kErrorColor,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kButtonColor,
      ),
    );
  }

  static TextTheme get _lightTextTheme {
    return TextTheme(
      title: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 23,
        fontWeight: FontWeight.w700,
        color: kTextTitleColor,
      ),
      caption: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18,
        color: kGreyColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 18.0,
        color: kAccentColor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      elevation: 0,
      color: kPrimaryColor,
      textTheme: _lightTextTheme.copyWith(
        title: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: kTextTitleColor,
        ),
      ),
      iconTheme: IconThemeData(
        color: kTextTitleColor,
      ),
    );
  }

  static FloatingActionButtonThemeData get _fabTheme {
    return FloatingActionButtonThemeData(
      backgroundColor: kAccentColor,
    );
  }
}

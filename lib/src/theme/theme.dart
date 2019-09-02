import 'package:flutter/material.dart';
import 'package:book_library/src/theme/colors.dart';

class Theme {
  static final ThemeData baseLight = ThemeData.light();
  static final ThemeData baseDark = ThemeData.dark();

  static ThemeData get lightTheme {
    return baseLight.copyWith(
      textTheme: _lightTextTheme,
      accentColor: kAccentColor,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kPrimaryColor,
      appBarTheme: _appBarTheme,
      floatingActionButtonTheme: _fabTheme,
      errorColor: kErrorColor,
      buttonColor: kAccentColor,
    );
  }

  static TextTheme get _lightTextTheme {
    return TextTheme(
      title: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: kTextTitleColor,
      ),
      caption: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        color: kGreyColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 17.0,
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

  static FloatingActionButtonThemeData get _fabTheme =>
      FloatingActionButtonThemeData(backgroundColor: kAccentColor);

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      textTheme: _darkTextTheme,
      accentColor: kAccentColorDark,
      primaryColor: kPrimaryColorDark,
      scaffoldBackgroundColor: kPrimaryColorDark,
      appBarTheme: _appBarThemeDark,
      floatingActionButtonTheme: _fabThemeDark,
      errorColor: kErrorColorDark,
      buttonColor: kAccentColorDark,
    );
  }

  static TextTheme get _darkTextTheme {
    return TextTheme(
      title: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        color: kGreyColorDark,
        fontWeight: FontWeight.w500,
      ),
      subtitle: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 17.0,
        color: kAccentColorDark,
      ),
    );
  }

  static FloatingActionButtonThemeData get _fabThemeDark =>
      FloatingActionButtonThemeData(
          backgroundColor: kAccentColorDark, foregroundColor: Colors.white);

  static AppBarTheme get _appBarThemeDark {
    return AppBarTheme(
      elevation: 0,
      color: kPrimaryColorDark,
      textTheme: _darkTextTheme.copyWith(
        title: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: kTextTitleColorDark,
        ),
      ),
      iconTheme: IconThemeData(
        color: kTextTitleColorDark,
      ),
    );
  }
}

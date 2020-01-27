import 'package:book_library/src/models/notifiers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/screens/home_screen.dart';
import 'package:book_library/src/theme/theme.dart' as libraryTheme;

void main() => runApp(BookLibrary());

class BookLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = ThemeNotifier();
    final bookNotifier = BookNotifier();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeNotifier),
        ChangeNotifierProvider(create: (_) => bookNotifier),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Book Library',
      darkTheme: libraryTheme.Theme.darkTheme,
      theme: themeNotifier.darkModeEnabled
          ? libraryTheme.Theme.darkTheme
          : libraryTheme.Theme.lightTheme,
      home: HomeScreen(),
    );
  }
}

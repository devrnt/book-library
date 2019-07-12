import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/screens/home_screen.dart';
import 'package:book_library/src/theme/theme.dart' as libraryTheme;

void main() => runApp(BookLibrary());

class BookLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookNotifier = BookNotifier();

    return ChangeNotifierProvider(
      builder: (_) => bookNotifier,
      child: MaterialApp(
        title: 'Book Library',
        theme: libraryTheme.Theme.lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}

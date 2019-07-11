import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(BookLibrary());

class BookLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookNotifier = BookNotifier();

    return ChangeNotifierProvider(
      builder: (_) => bookNotifier,
      child: MaterialApp(
        title: 'Book Library',
        home: HomeScreen(),
      ),
    );
  }
}

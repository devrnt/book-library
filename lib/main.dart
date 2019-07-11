import 'package:flutter/material.dart';

void main() => runApp(BookLibrary());

class BookLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      home: Container(color: Colors.pink),
    );
  }
}

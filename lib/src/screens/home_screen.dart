import 'package:flutter/material.dart';
import 'package:book_library/src/screens/book/book_add.dart';
import 'package:book_library/src/widgets/book_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        child: BookList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => BookAdd()));
        },
      ),
    );
  }

  get appBar {
    return AppBar(title: Text('Book Library'));
  }
}

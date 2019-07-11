import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/widgets/book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookNotifier = Provider.of<BookNotifier>(context);

    return Scaffold(
      appBar: appBar,
      body: Container(
        child: BookList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          bookNotifier.addBook(bookToAdd);
        },
      ),
    );
  }

  get appBar {
    return AppBar(title: Text('Book Library'));
  }
}

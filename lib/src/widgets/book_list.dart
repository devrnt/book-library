import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/widgets/book_item.dart';
import 'package:book_library/src/models/book.dart';

class BookList extends StatelessWidget {
  final List<Book> _books;

  BookList({books}) : _books = books;

  @override
  Widget build(BuildContext context) {
    var bookNotifier = Provider.of<BookNotifier>(context);

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: ((context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Divider(
            color: Colors.grey.withOpacity(0.3),
            height: 18.0,
          ),
        );
      }),
      itemCount: _books?.length ?? bookNotifier.books.length,
      itemBuilder: ((context, index) {
        return BookItem(_books?.elementAt(index) ?? bookNotifier.books[index]);
      }),
    );
  }
}

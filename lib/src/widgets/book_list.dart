import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/screens/book/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookNotifier = Provider.of<BookNotifier>(context);

    return ListView(
      children: [
        for (var book in bookNotifier.books)
          ListTile(
            title: Text('${book.title}'),
            subtitle: Text('by ${book.author}'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => BookDetails(book)));
            },
          )
      ],
    );
  }
}

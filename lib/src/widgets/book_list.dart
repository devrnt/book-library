import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookNotifier = Provider.of<BookNotifier>(context);

    if (bookNotifier.loading) {
      return Center(
        child: CircularProgressIndicator()
      );
    } else {
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
        itemCount: bookNotifier.books.length,
        itemBuilder: ((context, index) {
          return BookItem(bookNotifier.books[index]);
        }),
      );
    }
  }
}

import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetails extends StatelessWidget {
  final Book _book;

  BookDetails(Book book) : _book = book;

  @override
  Widget build(BuildContext context) {
    var bookNotifier = Provider.of<BookNotifier>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 6,
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/book-cover-placeholder.png',
                      image: _book.coverUrl,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 350),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${_book.title}'),
                          Text('By ${_book.author}'),
                          Text('By ${_book.category}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Text(_book.description),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          bookNotifier.removeBook(_book);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

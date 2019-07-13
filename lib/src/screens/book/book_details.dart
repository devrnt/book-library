import 'package:book_library/src/screens/book/book_add.dart';
import 'package:book_library/src/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/widgets/star_rating.dart';

class BookDetails extends StatelessWidget {
  final Book _book;

  BookDetails(Book book) : _book = book;

  @override
  Widget build(BuildContext context) {
    var bookNotifier = Provider.of<BookNotifier>(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          // color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: BookCover(
                  url: _book.coverUrl,
                  boxFit: BoxFit.fitHeight,
                  height: 325,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 4.0),
                child: Text(
                  '${_book.title}',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By ',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      TextSpan(
                        text: '${_book.author}',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      TextSpan(
                        text: ' in ',
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: '${_book.category}',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              StarRating(
                starCount: 5,
                rating: (_book.rating / 2).toDouble(),
              ),
              Divider(
                color: Colors.grey.withOpacity(0.5),
                height: 38.0,
              ),
              Text(
                '${_book.description}',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontFamily: 'Nunito',
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => _showDeleteDialog(context, bookNotifier),
        // () {
        //   bookNotifier.removeBook(_book);
        //   Navigator.of(context).pop();
        // },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Details'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.edit,
            size: 22.0,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BookAdd(book: _book),
              ),
            );
          },
        ),
      ],
    );
  }

  void _showDeleteDialog(
      BuildContext context, BookNotifier bookNotifier) async {
    final dialog = AlertDialog(
      title: Text('Delete book?'),
      content: Text(
        'This will delete the book from your book list',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text('ACCEPT'),
          onPressed: () {
            bookNotifier.removeBook(_book);
            // Pop dialog
            Navigator.of(context).pop();
            // Pop details screen
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    await showDialog(context: context, builder: (context) => dialog);
  }
}

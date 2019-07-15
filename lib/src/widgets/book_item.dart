import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/widgets/book_cover.dart';
import 'package:book_library/src/widgets/star_rating.dart';
import 'package:book_library/src/screens/book/book_details.dart';
import 'package:book_library/src/style.dart';

class BookItem extends StatelessWidget {
  final Book _book;

  BookItem(this._book);

  @override
  Widget build(BuildContext context) {
    var bookNotifier = Provider.of<BookNotifier>(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (MediaQuery.of(context).size.width > wideLayoutThreshold) {
          bookNotifier.selectedIndex = bookNotifier.books.indexOf(_book);
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => BookDetails(_book)));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 25.0),
        height: 260.0,
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: BookCover(url: _book.coverUrl),
            ),
            Flexible(
              flex: 6,
              child: Container(
                decoration: bookNotifier.selectedIndex ==
                            bookNotifier.books.indexOf(_book) &&
                        MediaQuery.of(context).size.width > wideLayoutThreshold
                    ? BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: 4.0,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      )
                    : null,
                padding: const EdgeInsets.fromLTRB(20.0, 18.0, 0.0, 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${_book.title}',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'By ${_book.author}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                    StarRating(
                      starCount: 5,
                      rating: (_book.rating / 2).toDouble(),
                    ),
                    Text(
                      '${_book.category}',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

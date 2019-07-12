import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/screens/book/book_details.dart';
import 'package:book_library/src/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:book_library/src/widgets/star_rating.dart';

class BookItem extends StatelessWidget {
  final Book _book;

  BookItem(this._book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BookDetails(_book)));
      },
      child: Container(
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

import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/screens/book/book_details.dart';
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
        height: 280.0,
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/book-cover-placeholder.png',
                    image: _book.coverUrl,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                    fadeInDuration: const Duration(milliseconds: 350),
                  ),
                ),
              ),
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
                    Text(
                      'By ${_book.category}',
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

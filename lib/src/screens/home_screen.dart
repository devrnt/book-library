import 'package:book_library/src/screens/book/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/models/notifiers/theme_notifier.dart';
import 'package:book_library/src/screens/book/book_add.dart';
import 'package:book_library/src/widgets/book_list.dart';
import 'package:book_library/src/style.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    var bookNotifier = Provider.of<BookNotifier>(context);
    // FIXME: Want to set wideScreen here but it can't be null
    // Don't know why it is not possible to initialize it here

    return Scaffold(
      appBar: _buildAppBar(context, themeNotifier),
      body: Container(
        child: MediaQuery.of(context).size.width > wideLayoutThreshold
            ? Row(
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    child: BookList(),
                  ),
                  Flexible(
                    flex: 6,
                    child: BookDetails(
                        bookNotifier.books[bookNotifier.selectedIndex]),
                  ),
                ],
              )
            : BookList(),
      ),
      floatingActionButton:
          MediaQuery.of(context).size.width < wideLayoutThreshold
              ? FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => BookAdd()));
                  },
                )
              : Container(),
    );
  }

  AppBar _buildAppBar(BuildContext context, ThemeNotifier themeNotifier) {
    return AppBar(
      title: Text('Book Library'),
      actions: [
        IconButton(
            icon: themeNotifier.darkModeEnabled
                ? Icon(Icons.brightness_7)
                : Icon(Icons.brightness_2),
            color: Theme.of(context).iconTheme.color,
            onPressed: () => themeNotifier.toggleTheme())
      ],
    );
  }
}

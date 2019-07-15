import 'package:book_library/src/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/models/notifiers/theme_notifier.dart';
import 'package:book_library/src/screens/book/book_add.dart';
import 'package:book_library/src/screens/book/book_details_tablet.dart';
import 'package:book_library/src/widgets/book_list.dart';

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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wideScreen = constraints.maxWidth > wideLayoutThreshold;
            if (wideScreen) {
              return Row(
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    child: BookList(),
                  ),
                  Flexible(
                    flex: 6,
                    child: BookDetailsTablet(
                        bookNotifier.books[bookNotifier.selectedIndex]),
                  ),
                ],
              );
            } else {
              return BookList();
            }
          },
        ),
      ),
      floatingActionButton: LayoutBuilder(
        builder: (context, constraints) {
          final wideScreen = constraints.maxWidth > wideLayoutThreshold;
          if (wideScreen) {
            return Container();
          } else {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => BookAdd()));
              },
            );
          }
        },
      ),
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

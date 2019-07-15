import 'package:book_library/src/models/notifiers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:book_library/src/screens/book/book_add.dart';
import 'package:book_library/src/widgets/book_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: _buildAppBar(context, themeNotifier),
      body: Container(
        child: BookList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => BookAdd()));
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
          onPressed: () {
            themeNotifier.toggleTheme();
          },
        )
      ],
    );
  }
}

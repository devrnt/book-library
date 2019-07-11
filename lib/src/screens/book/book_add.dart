import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookAdd extends StatefulWidget {
  @override
  _BookAddState createState() => _BookAddState();
}

class _BookAddState extends State<BookAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a book'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: AddBookForm(),
        ),
      ),
    );
  }
}

class AddBookForm extends StatefulWidget {
  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  var _title = '';
  var _author = '';
  var _description = '';
  var _coverUrl = '';
  var _category = '';

  @override
  Widget build(BuildContext context) {
    var bookNotifier = Provider.of<BookNotifier>(context);

    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter a book title';
              }
              return null;
            },
            onSaved: (value) => _title = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Author'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter the author';
              }
              return null;
            },
            onSaved: (value) => _author = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Desciption'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter the description';
              }
              return null;
            },
            onSaved: (value) => _description = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Cover url'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter the cover url';
              }
              return null;
            },
            onSaved: (value) => _coverUrl = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Category'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter the category';
              }
              return null;
            },
            onSaved: (value) => _category = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  final book =
                      Book(_title, _author, _description, _coverUrl, _category);

                  bookNotifier.addBook(book);
                  Navigator.pop(context);
                }
              },
              child: Text('ADD'),
            ),
          ),
        ],
      ),
    );
  }
}

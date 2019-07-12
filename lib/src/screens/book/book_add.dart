import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/widgets/buttons/confirm_button.dart';
import 'package:book_library/src/widgets/inputs/book_text_form_field.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          BookTextFormField(
            labelText: 'Title',
            errorText: 'Enter a book title',
            onSaved: (value) => _title = value,
          ),
          BookTextFormField(
            labelText: 'Author',
            errorText: 'Enter an author',
            onSaved: (value) => _author = value,
          ),
          BookTextFormField(
            labelText: 'Description',
            errorText: 'Enter a description',
            onSaved: (value) => _description = value,
          ),
          BookTextFormField(
            labelText: 'Cover url',
            errorText: 'Enter a cover url',
            onSaved: (value) => _coverUrl = value,
          ),
          BookTextFormField(
            labelText: 'Category',
            errorText: 'Enter a category',
            onSaved: (value) => _category = value,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: ConfirmButton(
              text: 'Add Book',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // TODO: replace rating with a Slider
                  final book = Book(
                      _title, _author, _description, _coverUrl, _category, 7.0);

                  bookNotifier.addBook(book);
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

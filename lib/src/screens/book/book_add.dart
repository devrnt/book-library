import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/widgets/buttons/confirm_button.dart';
import 'package:book_library/src/widgets/inputs/book_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookAdd extends StatelessWidget {
  final Book book;

  BookAdd({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book == null ? 'Add a book' : 'Update book'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: AddBookForm(book: book),
        ),
      ),
    );
  }
}

class AddBookForm extends StatefulWidget {
  final Book book;

  AddBookForm({this.book});

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
            initialValue: widget.book?.title,
            onSaved: (value) => _title = value,
          ),
          BookTextFormField(
            labelText: 'Author',
            errorText: 'Enter an author',
            onSaved: (value) => _author = value,
            initialValue: widget.book?.author,
          ),
          BookTextFormField(
            labelText: 'Description',
            errorText: 'Enter a description',
            initialValue: widget.book?.description,
            onSaved: (value) => _description = value,
          ),
          BookTextFormField(
            labelText: 'Cover url',
            errorText: 'Enter a cover url',
            initialValue: widget.book?.coverUrl,
            onSaved: (value) => _coverUrl = value,
          ),
          BookTextFormField(
            labelText: 'Category',
            errorText: 'Enter a category',
            initialValue: widget.book?.category,
            onSaved: (value) => _category = value,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: ConfirmButton(
              text: widget.book == null ? 'Add Book' : 'Update Book',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  final book = Book(
                      _title, _author, _description, _coverUrl, _category, 7.0);

                  if (widget.book == null) {
                    // TODO: replace rating with a Slider

                    bookNotifier.addBook(book);
                    Navigator.pop(context);
                  } else {
                    bookNotifier.updateBook(widget.book, book);
                    Navigator.of(context).pop();
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:book_library/src/models/book.dart';
import 'package:flutter/widgets.dart';

/// Class used to manage the state in the app
/// Contains all the books that are available
/// and provides methods to manage the state such as
/// addBook, removeBook
class BookNotifier extends ChangeNotifier {
  List<Book> _books;
  List<Book> get books => _books;
  set books(List<Book> books) {
    _books = books;
    notifyListeners();
  }

  BookNotifier() {
    _books = initialBooks;
  }

  Book addBook(Book book) {
    books = (_books..add(book));
    return book;
  }

  Book removeBook(Book book) {
    books = (_books..remove(book));
    return book;
  }
}

import 'package:book_library/src/models/book.dart';
import 'package:flutter/cupertino.dart';

/// Class used to manage the state in the app
/// Contains all the books that are available
/// and provides methods to manage the state such as
/// addBook, removeBook
class BookNotifier extends ChangeNotifier {
  List<Book> _books;
  List<Book> get books => _books;
  set(List<Book> books) {
    _books = books;
    notifyListeners();
  }

  BookNotifier() {
    set(initialBooks);
  }

  Book addBook(Book book) {
    set(_books..add(book));
    return book;
  }
}

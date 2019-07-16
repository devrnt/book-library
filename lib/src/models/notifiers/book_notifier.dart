import 'package:book_library/src/models/book.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  bool _loading = true;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  int _selectedIndex;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  BookNotifier() {
    fetchBooks();
    _selectedIndex = 0;
  }

  Book addBook(Book book) {
    books = (_books..add(book));
    return book;
  }

  Book removeBook(Book book) {
    books = (_books..remove(book));
    return book;
  }

  Book updateBook(Book oldBook, Book newBook) {
    // TODO: Give a book an unique property so we can search in the books
    // and update the properties with the updated version
    oldBook.author = newBook.author;
    oldBook.category = newBook.category;
    oldBook.coverUrl = newBook.coverUrl;
    oldBook.description = newBook.description;
    oldBook.rating = newBook.rating;
    oldBook.title = newBook.title;

    final index = books.indexOf(oldBook);
    books[index] = newBook;
    notifyListeners();
    return newBook;
  }

  void fetchBooks() async {
    loading = true;
    final client = http.Client();

    final response = await client.get('http://10.0.2.2:8080');
    final books = parseBooks(jsonDecode(response.body));
    _books = books;
    loading = false;
  }

  List<Book> parseBooks(dynamic responseBody) {
    return responseBody.map<Book>((json) => Book.fromJson(json)).toList();
  }
}

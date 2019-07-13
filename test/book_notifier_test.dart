import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BookNotifier', () {
    test('Book should be added', () {
      final bookNotifier = BookNotifier();
      var bookCount = bookNotifier.books.length;

      bookNotifier.addBook(bookToAdd);

      expect(bookNotifier.books.length, ++bookCount);
    });

    test('Book should be removed', () {
      final bookNotifier = BookNotifier();
      var bookCount = bookNotifier.books.length;

      bookNotifier.removeBook(bookNotifier.books.first);

      expect(bookNotifier.books.length, --bookCount);
    });
  });
}

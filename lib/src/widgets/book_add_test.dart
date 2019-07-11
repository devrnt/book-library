import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/screens/book/book_add.dart';
import 'package:book_library/src/widgets/book_list.dart';
import 'package:flutter/material.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Book Add Widget', () {
    testWidgets('Add book screen shows submit button', (tester) async {
      // Arrange
      var bookNotifier = BookNotifier()..books = initialBooks;

      // Act
      await tester.pumpWidget(
        ChangeNotifierProvider<BookNotifier>(
          builder: (_) => bookNotifier,
          child: MaterialApp(
            home: Scaffold(
              body: BookAdd(),
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(RaisedButton), findsOneWidget);
    });

    testWidgets('Adding book adds it to the list of books', (tester) async {
      // Arrange
      var bookNotifier = BookNotifier()..books = initialBooks;

      // Act
      await tester.pumpWidget(
        ChangeNotifierProvider<BookNotifier>(
          builder: (_) => bookNotifier,
          child: MaterialApp(
            home: Scaffold(
              body: BookAdd(),
            ),
          ),
        ),
      );

      final inputTitle = find.byType(TextFormField).at(0);
      final inputAuthor = find.byType(TextFormField).at(1);
      final inputDescription = find.byType(TextFormField).at(2);
      final inputCoverUrl = find.byType(TextFormField).at(3);
      final inputCategory = find.byType(TextFormField).at(4);

      await tester.enterText(inputTitle, 'Some text');
      await tester.enterText(inputAuthor, 'Some text');
      await tester.enterText(inputDescription, 'Some text');
      await tester.enterText(inputCoverUrl, 'Some text');
      await tester.enterText(inputCategory, 'Some text');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(RaisedButton));
      await tester.pumpAndSettle();

      // Assert
      expect(bookNotifier.books.length, 4);
    });
  });
}

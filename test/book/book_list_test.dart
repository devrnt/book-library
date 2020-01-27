import 'package:flutter/material.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:provider/provider.dart';

import 'package:book_library/src/models/book.dart';
import 'package:book_library/src/models/notifiers/book_notifier.dart';
import 'package:book_library/src/models/notifiers/theme_notifier.dart';
import 'package:book_library/src/widgets/book_item.dart';
import 'package:book_library/src/widgets/book_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BookNotifier bookNotifier;
  ThemeNotifier themeNotifier;

  setUp(() {
    bookNotifier = BookNotifier();
    themeNotifier = ThemeNotifier();
  });

  group('Book List Widget', () {
    testWidgets('Displays all the books supplied by the notifier',
        (tester) async {
      provideMockedNetworkImages(() async {
        // Arrange
        bookNotifier..books = initialBooks;

        // Act
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<BookNotifier>(create: (_) => bookNotifier),
              ChangeNotifierProvider<ThemeNotifier>(
                  create: (_) => themeNotifier)
            ],
            child: MaterialApp(
              home: Scaffold(
                body: BookList(),
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(BookItem, skipOffstage: false), findsNWidgets(3));
      });
    });

    testWidgets('Displays no books when the supplied books list is empty',
        (tester) async {
      // Arrange
      bookNotifier..books = [];

      // Act
      await tester.pumpWidget(
        ChangeNotifierProvider<BookNotifier>(
          create: (_) => bookNotifier,
          child: MaterialApp(
            home: Scaffold(
              body: BookList(),
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('When book is clicked open book details screen',
        (tester) async {
      provideMockedNetworkImages(() async {
        // Arrange
        bookNotifier..books = initialBooks;

        // Act
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<BookNotifier>(
                create: (_) => bookNotifier,
              ),
              ChangeNotifierProvider<ThemeNotifier>(
                  create: (_) => themeNotifier),
            ],
            child: MaterialApp(
              home: Scaffold(
                body: BookList(),
              ),
            ),
          ),
        );

        await tester.tap(find.byType(BookItem).first);
        await tester.pumpAndSettle();

        // Assert
        expect(find.text(initialBooks.first.title), findsOneWidget);
        expect(find.text(initialBooks.last.title), findsNothing);
      });
    });
  });
}

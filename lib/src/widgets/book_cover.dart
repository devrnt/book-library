import 'package:book_library/src/models/notifiers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCover extends StatelessWidget {
  final String url;
  final BoxFit boxFit;
  final double height;

  BookCover({@required this.url, this.boxFit = BoxFit.fitWidth, this.height});

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    final assetPath =
        'assets/images/book-cover-placeholder-${themeNotifier.darkModeEnabled ? 'dark' : 'light'}.png';

    return Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: themeNotifier.darkModeEnabled
                ? Colors.black.withOpacity(0.40)
                : Colors.black.withOpacity(0.20),
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: FadeInImage.assetNetwork(
          placeholder: assetPath,
          image: url,
          fit: boxFit,
          alignment: Alignment.topCenter,
          fadeInDuration: const Duration(milliseconds: 350),
        ),
      ),
    );
  }
}

# Book Library

Book Library application where u can make simple CRUD operations (create, read, update, delete).
This application has a dark theme, the state is managed by the `ThemeNotifier` class and injected by the `Provider` package.
This simple application demonstrates the use of the `Provider` package in specific the `ChangeNotifierProvider`.
I make use of a simple model, together with a `Notifier` class which extends from `ChangeNotifier`.

## Showcase
### Phone
Light Theme        |  Dark Theme
:-------------------------:|:-------------------------:
![Showcase](showcase/showcase.gif)  | ![Showcase dark theme](showcase/showcase_dark.gif)

### Tablet
This project contains adaptive widgets, to display both on a phone and a tablet.

![Showcase Tablet](showcase/showcase_tablet.gif)

## Project
This project is mainly focused for Flutter users who would like to use the `Provider` package suggested by the Flutter team.
So in short this project contains following use cases:
* Use of a `extends ChangeNotifier` class
* Provide the `ChangeNotifier` class with `ChangeNotifierProvider` from the `Provider` package 
* Simple widget tests
* Dark and light theme, with the possibilty to switch at runtime
* Adaptive widgets to display on both a phone and tablet (master and details view)
* Use of assets
* Use of external fonts
* Logo generations by `flutter_launcher_icons` package
* Flutter version: `1.7.8+hotfix.3`

Design inspired by [Shirish Shikhrakar ](https://dribbble.com/shots/6552218-Reading-Application)

### Tests

This Flutter app contains some simple widget tests to demonstrate the way you should handle widget tests in your Flutter app. These tests should be run every time you commit a change, if needed update the tests.
This will ensure the quality of your application.

## Getting Started

Clone this repo and look into the source code
```
git clone https://github.com/devrnt/book-library-flutter.git
```

### Application
```
flutter run 
```

### Tests

```
flutter test
```

## Packages
* [Provider](https://pub.dev/packages/provider)
* [smooth_star_rating](https://pub.dev/packages/smooth_star_rating)
* [image_test_utils](https://pub.dev/packages/image_test_utils)
* [smooth_star_rating](https://pub.dev/packages/smooth_star_rating)
* [flutter_speed_dial](https://pub.dev/packages/flutter_speed_dial)
* [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
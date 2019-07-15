import 'package:flutter/widgets.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _darkModeEnabled = false;
  bool get darkModeEnabled => _darkModeEnabled;
  set darkModeEnabled(bool flag) {
    _darkModeEnabled = flag;
    notifyListeners();
  }

  bool toggleTheme() {
    darkModeEnabled = !_darkModeEnabled;
    return darkModeEnabled;
  }
}

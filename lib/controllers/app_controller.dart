import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  bool isDarkTheme = true;
  int noCoins = 0;

  static AppController instance = AppController();

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  increaseNoCoins() {
    noCoins += 300;
    notifyListeners();
  }

  decreaseNoCoins() {
    noCoins -= 100;
    notifyListeners();
  }
}

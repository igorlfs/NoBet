import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppController extends ChangeNotifier {
  bool isDarkTheme = true;
  int noCoins = 0;
  String markdownFilePath = 'assets/markdown/Básico.md';
  final learnState = ValueNotifier<LearnState>(LearnState.start);
  String markdownContent = '';

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

  Future<void> loadFile(String file) async {
    final newPath = 'assets/markdown/$file';
    learnState.value = LearnState.loading;

    try {
      AppController.instance.markdownContent =
          await rootBundle.loadString(newPath);
      learnState.value = LearnState.success;
    } catch (e) {
      learnState.value = LearnState.error;
    }
  }
}

enum LearnState { start, loading, success, error }

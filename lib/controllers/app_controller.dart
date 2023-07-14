import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppController extends ChangeNotifier {
  bool isDarkTheme = true;
  int noCoins = 0;
  int blazes = 0;
  String markdownFilePath = 'assets/markdown/Básico.md';
  final learnState = ValueNotifier<LearnState>(LearnState.start);
  String markdownContent = '';

  static AppController instance = AppController();

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  void increaseBlazes() {
    blazes++;
    notifyListeners();
  }

  blazeString() {
    if (blazes == 0) {
      return '';
    } else {
      return ' $blazes 🔥';
    }
  }

  void increaseNoCoins() {
    noCoins += 300;
    notifyListeners();
  }

  void decreaseNoCoins() {
    noCoins -= 100;
    notifyListeners();
  }

  Future<void> loadFile(String file) async {
    learnState.value = LearnState.loading;

    try {
      AppController.instance.markdownContent =
          await rootBundle.loadString(file);
      learnState.value = LearnState.success;
    } catch (e) {
      learnState.value = LearnState.error;
    }
  }
}

enum LearnState { start, loading, success, error }

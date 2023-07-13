import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LearnListController {
  List<String> fileList = [];

  final state = ValueNotifier<LearnListState>(LearnListState.start);

  // TODO Ler o diretório (isso aqui é uma gambiarra)
  Future<void> readFileAndSplitLines(String filePath) async {
    state.value = LearnListState.loading;

    try {
      fileList = (await rootBundle.loadString(filePath)).split('\n');
      // Por motivos de Linux, é como se a última linha tivesse dois '\n'
      fileList.removeLast();
      state.value = LearnListState.success;
    } catch (e) {
      state.value = LearnListState.error;
    }
  }
}

enum LearnListState { start, loading, success, error }

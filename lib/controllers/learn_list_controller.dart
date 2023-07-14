import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LearnListController {
  List<String> fileList = [];

  final state = ValueNotifier<LearnListState>(LearnListState.start);

  Future<void> readLessonPaths(String filePath) async {
    state.value = LearnListState.loading;

    try {
      // Cortesia de https://stackoverflow.com/a/56555070
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      final imagePaths = manifestMap.keys
          .where((String key) => key.contains('markdown/'))
          .toList();
      fileList = imagePaths;
      state.value = LearnListState.success;
    } catch (e) {
      state.value = LearnListState.error;
    }
  }
}

enum LearnListState { start, loading, success, error }

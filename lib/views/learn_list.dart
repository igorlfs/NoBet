import 'package:flutter/material.dart';
import 'package:nobet/controllers/app_controller.dart';
import 'package:nobet/controllers/learn_list_controller.dart';

class LearnList extends StatefulWidget {
  const LearnList({super.key});

  @override
  State<LearnList> createState() => _LearnListState();
}

class _LearnListState extends State<LearnList> {
  final String fileListPath = 'assets/helpers/lessons.txt';
  final controller = LearnListController();

  @override
  void initState() {
    super.initState();
    controller.readFileAndSplitLines(fileListPath);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        });
  }

  stateManagement(LearnListState state) {
    switch (state) {
      case LearnListState.start:
        return _start();
      case LearnListState.loading:
        return _loading();
      case LearnListState.error:
        return _error();
      case LearnListState.success:
        return _success();
      default:
        return _start();
    }
  }

  _start() {
    return Container();
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _error() {
    return const Center(
      child: Text('Ocorreu um erro ao ler a pasta com as lições'),
    );
  }

  _success() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.fileList.length,
        itemBuilder: (BuildContext context, int index) {
          final path = controller.fileList[index];
          var strippedPath = '';
          if (path.length > 3) {
            strippedPath = path.substring(0, path.length - 3);
          }
          return ListTile(
            title: Text(
              '${index + 1}. $strippedPath',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              AppController.instance.loadFile(path);
            },
          );
        },
      ),
    );
  }
}

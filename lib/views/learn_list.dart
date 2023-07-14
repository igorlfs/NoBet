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
    controller.readLessonPaths(fileListPath);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.state,
      builder: (context, child) {
        return stateManagement(controller.state.value);
      },
    );
  }

  Widget stateManagement(LearnListState state) {
    switch (state) {
      case LearnListState.start:
        return Container();
      case LearnListState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LearnListState.success:
        return _success();
      default:
        return Container();
    }
  }

  _success() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.fileList.length,
        itemBuilder: (BuildContext context, int index) {
          final path = controller.fileList[index];
          var strippedPath = '';
          if (path.length > 3) {
            final lastSlash = path.lastIndexOf('/');
            strippedPath = path.substring(lastSlash + 1, path.length - 3);
          }
          return ListTile(
            title: Text(
              '${index + 1}. $strippedPath',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () async {
              AppController.instance.loadFile(path);
            },
          );
        },
      ),
    );
  }
}

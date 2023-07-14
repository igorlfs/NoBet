import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:nobet/controllers/app_controller.dart';
import 'package:nobet/util/code.dart';

class Learn extends StatefulWidget {
  const Learn({
    super.key,
  });

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  @override
  void initState() {
    super.initState();
    AppController.instance.loadFile(AppController.instance.markdownFilePath);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance.learnState,
      builder: (context, child) {
        return stateManagement(AppController.instance.learnState.value);
      },
    );
  }

  Widget stateManagement(LearnState state) {
    switch (state) {
      case LearnState.start:
        return Container();
      case LearnState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case LearnState.error:
        return Center(
          child: Text(
            'Ocorreu um erro ao ler a lição ${AppController.instance.markdownFilePath}',
          ),
        );
      case LearnState.success:
        return _success();
      default:
        return Container();
    }
  }

  Widget _success() {
    return Markdown(
      data: AppController.instance.markdownContent,
      selectable: true,
      extensionSet: md.ExtensionSet(
        md.ExtensionSet.gitHubFlavored.blockSyntaxes,
        [md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
      ),
      builders: {
        'code': CodeElementBuilder(),
      },
    );
  }
}

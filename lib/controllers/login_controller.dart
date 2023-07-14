import 'package:flutter/material.dart';

class LoginController {
  final state = ValueNotifier<LoginState>(LoginState.start);

  Future<void> waitAndDisplayError(BuildContext context) async {
    state.value = LoginState.loading;

    await Future.delayed(const Duration(seconds: 2));

    // Provavelmente existe um jeito melhor de fazer isso
    // Ref https://stackoverflow.com/a/69253529
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text(
                'Ocorreu um erro ao realizar o cadastro.\n\nPor favor, tente novamente mais tarde.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Fechar'),
              )
            ],
          );
        },
      );
      state.value = LoginState.error;
    }
  }
}

enum LoginState { start, loading, error }

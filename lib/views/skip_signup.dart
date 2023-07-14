import 'package:flutter/material.dart';

class SkipSignup extends StatelessWidget {
  const SkipSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Pular Cadastro'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Boas Vindas!'),
              content: const Text(
                  'Isso mesmo! Nós da NoBet, pensando na sua conveniência, permitimos com que você aposte sem fazer uma conta!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: const Text('Apostar!'),
                )
              ],
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nobet/views/logo.dart';
import 'package:nobet/views/skip_signup.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Início')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: const Text('Criar Conta'),
            ),
            const SkipSignup()
          ],
        ),
      ),
    );
  }
}

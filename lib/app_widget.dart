import 'package:flutter/material.dart';
import 'package:nobet/controllers/app_controller.dart';
import 'package:nobet/pages/home.dart';
import 'package:nobet/pages/login.dart';
import 'package:nobet/pages/login_banking.dart';
import 'package:nobet/pages/login_questions.dart';
import 'package:nobet/pages/start.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.amber,
              brightness: AppController.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light),
          initialRoute: '/start',
          routes: {
            '/start': (context) => const StartPage(),
            '/login': (context) => const LoginPage(),
            '/login/questions': (context) => const LoginQuestionsPage(),
            '/login/banking': (context) => const LoginBankingPage(),
            '/home': (context) => const HomePage(),
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nobet/pages/home.dart';
import 'package:nobet/pages/login.dart';
import 'package:nobet/pages/login_banking.dart';
import 'package:nobet/pages/login_questions.dart';
import 'package:nobet/pages/start.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      initialRoute: '/start',
      routes: {
        '/start': (context) => const StartPage(),
        '/login': (context) => const LoginPage(),
        '/login/questions': (context) => const LoginQuestionsPage(),
        '/login/banking': (context) => const LoginBankingPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

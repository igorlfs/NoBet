import 'package:flutter/material.dart';
import 'package:nobet/views/logo.dart';
import 'package:nobet/views/skip_signup.dart';

class LoginQuestionsPage extends StatefulWidget {
  const LoginQuestionsPage({super.key});

  @override
  State<LoginQuestionsPage> createState() => _LoginQuestionsPageState();
}

class _LoginQuestionsPageState extends State<LoginQuestionsPage> {
  String pet = '';
  String street = '';
  String person = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas de Segurança'),
      ),
      body: _body(context),
    );
  }

  SingleChildScrollView _body(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Por favor, responda as seguintes perguntas para completar seu cadastro',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Qual era o nome do seu primeiro bichinho de estimação?',
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          pet = text;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Pet',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Qual o nome da rua do seu primeiro endereço?',
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          street = text;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Rua',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Qual o nome da pessoa que está na sua esquerda?',
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          person = text;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Pessoa',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login/banking');
                        },
                        child: const Text('Estamos quase lá!'),
                      ),
                      const SkipSignup(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

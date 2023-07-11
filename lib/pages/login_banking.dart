import 'package:flutter/material.dart';
import 'package:nobet/views/logo.dart';
import 'package:nobet/views/skip_signup.dart';

class LoginBankingPage extends StatefulWidget {
  const LoginBankingPage({super.key});

  @override
  State<LoginBankingPage> createState() => _LoginBankingPageState();
}

class _LoginBankingPageState extends State<LoginBankingPage> {
  String cardNumber = '';
  String date = '';
  String cvv = '';
  String color = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informações Bancárias')),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
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
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          cardNumber = text;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Número do Cartão de Crédito',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          date = text;
                        },
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          labelText: 'Data de Validade',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          cvv = text;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'CVV',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () async {
                          await Future.delayed(const Duration(seconds: 2));
                          // TODO reescrever isso aqui porque o linter reclama
                          // Seria legal mudar o texto pro ícone de loading e depois dar o erro
                          // Mas seria necessário gerenciar o estado e pipipi
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
                              });
                        },
                        child: const Text('Finalizar cadastro'),
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

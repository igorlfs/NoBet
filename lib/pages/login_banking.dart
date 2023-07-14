import 'package:flutter/material.dart';
import 'package:nobet/controllers/login_controller.dart';
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

  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informações Bancárias')),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.state,
      builder: (context, child) {
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
                              'Para concluir, por favor preencha suas informações bancárias',
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
                          TextField(
                            onChanged: (text) {
                              cardNumber = text;
                            },
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Cartão de Crédito',
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
                              await controller.waitAndDisplayError(context);
                            },
                            child: stateManagement(
                                controller.state.value, context),
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
      },
    );
  }

  Widget stateManagement(LoginState state, BuildContext context) {
    switch (state) {
      case LoginState.start:
        return const Text('Finalizar cadastro');
      case LoginState.error:
        return const Text('Tentar novamente');
      case LoginState.loading:
        return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        );
      default:
        return Container();
    }
  }
}

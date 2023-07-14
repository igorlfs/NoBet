import 'package:flutter/material.dart';
import 'package:nobet/controllers/app_controller.dart';
import 'package:nobet/controllers/roullete_controller.dart';

class Roulette extends StatefulWidget {
  const Roulette({
    super.key,
  });

  @override
  State<Roulette> createState() => _RouletteState();
}

class _RouletteState extends State<Roulette> {
  final controller = RouletteController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 350,
          child: Image.asset('assets/images/roullete.png'),
        ),
        const Text(
          'ESCOLHA UMA COR',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.setColor(color: RouletteColor.green);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'PRETO',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setColor(color: RouletteColor.black);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'VERDE',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setColor(color: RouletteColor.red);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'VERMELHO',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            if (controller.odds != RouletteController.invalid) {
              final name = controller.colorName;
              if (controller.bet(0.001)) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Você ganhou um Blaze!'),
                      content: Image.asset('assets/images/blaze.png'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Fechar'),
                          onPressed: () {
                            AppController.instance.increaseBlazes();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else if (controller.bet()) {
                _popup(
                    context: context,
                    title: 'Você VENCEU',
                    content:
                        'Ao escolher a cor $name, você GANHOU 300 noCoins');
                AppController.instance.increaseNoCoins();
              } else {
                _popup(
                    context: context,
                    title: 'Você PERDEU',
                    content:
                        'Ao escolher a cor $name, você PERDEU 100 noCoins');
                AppController.instance.decreaseNoCoins();
              }
            } else {
              _popup(
                context: context,
                title: "Cor não escolhida",
                content: 'É necessário selecionar uma cor para jogar Roleta',
              );
            }
          },
          child: const Text(
            'APOSTAR',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _popup(
      {required BuildContext context,
      required String title,
      required String content}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

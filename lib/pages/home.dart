import 'package:flutter/material.dart';
import 'package:nobet/controllers/app_controller.dart';
import 'package:nobet/views/roulette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    accountName: const Text('Apostador Anônimo'),
                    accountEmail:
                        Text('${AppController.instance.noCoins} noCoins'),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              actions: [
                Switch(
                  value: AppController.instance.isDarkTheme,
                  onChanged: (value) {
                    AppController.instance.changeTheme();
                  },
                )
              ],
              bottom: const TabBar(
                indicatorColor: Colors.amber,
                tabs: [
                  Tab(
                    text: 'Apostar',
                  ),
                  Tab(
                    text: 'Aprender',
                  ),
                ],
              ),
              title: const Text('NoBet'),
            ),
            body: const TabBarView(
              children: [
                Roulette(),
                // TODO
                Text('aaaa'),
              ],
            ),
          ),
        );
      },
    );
  }
}

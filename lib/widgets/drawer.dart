import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/historicoPage.dart';
import 'package:flutter_safraapp/views/insumoPage.dart';
import 'package:flutter_safraapp/views/lavouraPage.dart';
import 'package:flutter_safraapp/views/dashboardPage.dart';
import 'package:flutter_safraapp/views/profilePage.dart';

class NavigationDrawer1 extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

//construção do drawer
class _NavigationDrawerState extends State<NavigationDrawer1> {
  //const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItens(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Material(
        color: Color.fromARGB(255, 8, 46, 28),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => profilePage()));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/41008/cowboy-ronald-reagan-cowboy-hat-hat-41008.jpeg?auto=compress&cs=tinysrgb&w=400'),
                ),
                SizedBox(height: 12),
                Text(
                  'José Lourenço da Silva',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Text(
                  'Araraquara, São Paulo',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItens(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 10,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Início'),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const dashboardPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.eco_rounded),
              title: const Text('Cadastro de Lavoura'),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const lavouraPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.water_drop),
              title: const Text('Registro de Uso de Aplicações'),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const insumoPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.history_outlined),
              title: const Text('Histórico de Aplicações'),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const historicoPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Seu Perfil'),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const profilePage(),
                ));
              },
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair da Conta'),
              onTap: () {},
            ),
          ],
        ),
      );
}

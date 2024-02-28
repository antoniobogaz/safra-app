import 'package:flutter/material.dart';
import 'package:flutter_safraapp/widgets/drawer.dart';

class lavouraPage extends StatefulWidget {
  const lavouraPage({super.key});

  @override
  State<lavouraPage> createState() => _lavouraPageState();
}

@override
class _lavouraPageState extends State<lavouraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer1(),
      appBar: AppBar(
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'images/Logo_SafraApp3.png', // Substitua pelo caminho da sua imagem
                  height: 40, // Ajuste a altura conforme necessário
                ),
              ],
            ),
          ),
        ),
        //automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      body: Center(
        child: Text('lavoura'),
      ),
    );
  }
}

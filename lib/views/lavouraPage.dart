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
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          color: Color.fromARGB(255, 2, 89, 47),
        ),
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10),
          child: Center(
            child: Text(
              'Cadastrar Lavoura'.toUpperCase(),
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

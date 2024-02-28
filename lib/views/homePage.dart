import 'package:flutter/material.dart';
import 'package:flutter_safraapp/widgets/drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_safraapp/views/lavouraPage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

@override
class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Center(child: Text('inicio')),
        drawer: NavigationDrawer1());
  }
}

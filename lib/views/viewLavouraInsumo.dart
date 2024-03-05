import 'package:flutter/material.dart';

class viewLavouraInsumoPage extends StatefulWidget {
  const viewLavouraInsumoPage({super.key});

  @override
  State<viewLavouraInsumoPage> createState() => _viewLavouraInsumoPageState();
}

@override
class _viewLavouraInsumoPageState extends State<viewLavouraInsumoPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*title: Text(
          'Suas Culturas',
          style: TextStyle(fontSize: 22),
        ),*/
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
      body:
          Center(child: Text('Lavoura com visão para as aplicações de insumo')),
    );
  }
}

import 'package:flutter/material.dart';

class viewInsumoPage extends StatefulWidget {
  const viewInsumoPage({super.key});

  @override
  State<viewInsumoPage> createState() => _viewInsumoPageState();
}

@override
class _viewInsumoPageState extends State<viewInsumoPage> {
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
      body: Center(child: Text('Visão geral do insumo cadastrado')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/viewAplicacao.dart';
import 'package:flutter/cupertino.dart';

class listarAplicacoesPage extends StatefulWidget {
  const listarAplicacoesPage({super.key});
  @override
  State<listarAplicacoesPage> createState() => _listarAplicacoesPageState();
}

@override
class _listarAplicacoesPageState extends State<listarAplicacoesPage> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Insumos Aplicados',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
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
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => viewAplicacaoPage()));
          },
          child: Card(
            margin: EdgeInsets.only(top: 1),
            child: ListTile(
                tileColor: Colors.white,
                //visualDensity: VisualDensity(vertical: 4),
                title: Text('Nome do Insumo Aplicado'),
                subtitle: Text('Descrição'),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 2, 89, 47),
                ),
                leading: Icon(
                  Icons.water_drop,
                  color: Color.fromARGB(255, 2, 89, 47),
                )),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/viewLavouraInsumo.dart';

class historicoPage extends StatefulWidget {
  const historicoPage({super.key});

  @override
  State<historicoPage> createState() => _historicoPageState();
}

@override
class _historicoPageState extends State<historicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Histórico de Aplicações',
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
                  'images/Logo_SafraApp3.png',
                  height: 40,
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => viewLavouraInsumoPage()));
          },
          child: Card(
            margin: EdgeInsets.only(top: 1),
            child: Container(
              //height: 130,
              child: ListTile(
                  tileColor: Colors.white,
                  visualDensity: VisualDensity(vertical: 4),
                  title: Text('Nome do insumo aplicado'),
                  subtitle: Text('Nome da Lavoura\nNome do Insumo Aplicado'),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: Color.fromARGB(255, 2, 89, 47),
                  ),
                  leading: Icon(
                    Icons.history_outlined,
                    color: Color.fromARGB(255, 2, 89, 47),
                    size: 35,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

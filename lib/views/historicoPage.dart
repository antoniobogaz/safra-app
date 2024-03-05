import 'package:flutter/material.dart';
import 'package:flutter_safraapp/widgets/drawer.dart';

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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Card(
          child: Container(
            height: 200,
            child: ListTile(
                tileColor: Color.fromARGB(255, 220, 220, 220),
                visualDensity: VisualDensity(vertical: 4),
                title: Text('Nome do insumo aplicado'),
                subtitle: Text('Breve descrição\nbreve descrição'),
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
    );
  }
}

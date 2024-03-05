import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/historicoPage.dart';
import 'package:flutter_safraapp/views/insumoPage.dart';
import 'package:flutter_safraapp/views/lavouraPage.dart';
import 'package:flutter_safraapp/views/profilePage.dart';
import 'package:flutter_safraapp/views/viewLavouraInsumo.dart';
import 'package:flutter_safraapp/widgets/bottom_nav_bar.dart';
import 'package:flutter_safraapp/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';

class dashboardPage extends StatefulWidget {
  const dashboardPage({super.key});
  @override
  State<dashboardPage> createState() => _dashboardPageState();
}

@override
class _dashboardPageState extends State<dashboardPage> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Suas Culturas',
          style: TextStyle(fontSize: 22),
        ),
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*Image.asset(
                  'images/Logo_SafraApp3.png', // Substitua pelo caminho da sua imagem
                  height: 40, // Ajuste a altura conforme necessário
                ),*/
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
            child: ListTile(
                tileColor: Color.fromARGB(255, 220, 220, 220),
                visualDensity: VisualDensity(vertical: 4),
                title: Text('Nome da Lavoura'),
                subtitle: Text('Descrição'),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 2, 89, 47),
                ),
                leading: Icon(
                  Icons.eco_outlined,
                  color: Color.fromARGB(255, 2, 89, 47),
                )),
          ),
        ),
      ),
      drawer: NavigationDrawer1(),
    );
  }
}

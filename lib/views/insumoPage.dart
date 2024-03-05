import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/addInsumo.dart';
import 'package:flutter_safraapp/views/viewInsumo.dart';
import 'package:flutter_safraapp/widgets/drawer.dart';

class insumoPage extends StatefulWidget {
  const insumoPage({super.key});

  @override
  State<insumoPage> createState() => _insumoPageState();
}

@override
class _insumoPageState extends State<insumoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer1(),
      appBar: AppBar(
        title: Text(
          'Seus Insumos',
          style: TextStyle(fontSize: 22),
        ),
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => addInsumoPage()));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
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
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => viewInsumoPage()));
          },
          child: Card(
            child: ListTile(
                tileColor: Color.fromARGB(255, 220, 220, 220),
                visualDensity: VisualDensity(vertical: 4),
                title: Text('Nome do Insumo'),
                subtitle: Text('Descrição'),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 2, 89, 47),
                ),
                leading: Icon(
                  Icons.water_drop_outlined,
                  color: Color.fromARGB(255, 2, 89, 47),
                )),
          ),
        ),
      ),
    );
  }
}

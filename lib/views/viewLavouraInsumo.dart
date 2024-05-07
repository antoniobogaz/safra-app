import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/cadernoCampo.dart';
import 'package:flutter_safraapp/views/listarAplicacoes.dart';

class viewLavouraInsumoPage extends StatefulWidget {
  //const viewLavouraInsumoPage({super.key});
  final DocumentSnapshot lavoura;

  viewLavouraInsumoPage({Key? key, required this.lavoura}) : super(key: key);
  @override
  State<viewLavouraInsumoPage> createState() => _viewLavouraInsumoPageState();
}

@override
class _viewLavouraInsumoPageState extends State<viewLavouraInsumoPage> {
  late Map<String, dynamic> data; // Definindo a variável data
  String? idLavoura = '';

  @override
  void initState() {
    super.initState();
    data = widget.lavoura.data() as Map<String, dynamic>;
    idLavoura = widget.lavoura.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 2, 89, 47),
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Visão Geral',
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
        //automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                    //color: Colors.white,
                    ),
                child: Center(
                  child: Text('Google Maps'),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, left: 15, bottom: 20),
                        child: Text(
                          data['nomePropriedade'],
                          style: TextStyle(
                              color: Color.fromARGB(255, 8, 46, 28),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            cadernoCampoPage()));*/
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 8, 46, 28),
                                size: 25,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 182, 19, 8),
                                size: 25,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 15),
                        child: Text(
                          'Tipo de Cultura',
                          style: TextStyle(
                              color: Color.fromARGB(255, 8, 46, 28),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1, left: 15),
                        child: Text(
                          data['cultura'],
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 46, 28),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 15),
                        child: Text(
                          'Variedade de Cultura',
                          style: TextStyle(
                              color: Color.fromARGB(255, 8, 46, 28),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1, left: 15),
                        child: Text(
                          data['variedade'],
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 46, 28),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 15),
                        child: Text(
                          'Data de Plantio',
                          style: TextStyle(
                              color: Color.fromARGB(255, 8, 46, 28),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1, left: 15),
                        child: Text(
                          data['dataPlantio'],
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 46, 28),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 15),
                        child: Text(
                          'Sistema de Plantio',
                          style: TextStyle(
                              color: Color.fromARGB(255, 8, 46, 28),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1, left: 15),
                        child: Text(
                          data['sistemaPlantio'],
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 46, 28),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 15),
                        child: Text(
                          'Tamanho da Área',
                          style: TextStyle(
                              color: Color.fromARGB(255, 8, 46, 28),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1, left: 15),
                        child: Text(
                          "${data['tamanhoArea']} ${data['medidaArea']}",
                          style: TextStyle(
                            color: Color.fromARGB(255, 8, 46, 28),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => listarAplicacoesPage()));
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 2, 89, 47),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'listar aplicações'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cadernoCampoPage(
                                      idLavoura_Parametro: idLavoura,
                                    )));
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 8, 46, 28),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Inserir Aplicação'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

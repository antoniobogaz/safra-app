import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/cadernoCampo.dart';
import 'package:flutter_safraapp/views/editLavoura.dart';
import 'package:flutter_safraapp/views/homePage.dart';
import 'package:flutter_safraapp/views/listarAplicacoes.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class viewLavouraInsumoPage extends StatefulWidget {
  //const viewLavouraInsumoPage({super.key});
  final DocumentSnapshot lavoura;

  viewLavouraInsumoPage({Key? key, required this.lavoura}) : super(key: key);
  @override
  State<viewLavouraInsumoPage> createState() => _viewLavouraInsumoPageState();
}

@override
class _viewLavouraInsumoPageState extends State<viewLavouraInsumoPage> {
  late Map<String, dynamic> data;
  String idLavoura = '';

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
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(-20.782634700407176, -49.38675446436698),
                      zoom: 10.2,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                    ],
                  ),
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
                        padding: const EdgeInsets.only(top: 18.0, left: 15, bottom: 20),
                        child: Text(
                          data['nomePropriedade'],
                          style: TextStyle(color: Color.fromARGB(255, 8, 46, 28), fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => editLavouraPage(idLavoura: idLavoura)));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 8, 46, 28),
                                size: 25,
                              )),
                          IconButton(
                              onPressed: () async {
                                await _confirmaExclusao(context);
                              },
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
                          style: TextStyle(color: Color.fromARGB(255, 8, 46, 28), fontSize: 20, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: Color.fromARGB(255, 8, 46, 28), fontSize: 20, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: Color.fromARGB(255, 8, 46, 28), fontSize: 20, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: Color.fromARGB(255, 8, 46, 28), fontSize: 20, fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: Color.fromARGB(255, 8, 46, 28), fontSize: 20, fontWeight: FontWeight.bold),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => listarAplicacoesPage(lavouraId: idLavoura)));
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
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                      nomePropriedade: data['nomePropriedade'],
                                      tamanhoArea: data['tamanhoArea'],
                                      medidaArea: data['medidaArea'],
                                      cultura: data['cultura'],
                                      variedade: data['variedade'],
                                      dataPlantio: data['dataPlantio'],
                                      sistemaPlantio: data['sistemaPlantio'],
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
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

  Future<bool> _confirmaExclusao(BuildContext context) async {
    bool? excluirLavoura = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Tem certeza?"),
            content: Text("Você Deseja mesmo EXCLUIR esta lavoura?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("Não")),
              TextButton(
                  onPressed: () {
                    deleteLavoura(idLavoura);
                  },
                  child: Text("Sim"))
            ],
          );
        });

    return excluirLavoura ?? false;
  }

  Future<void> deleteLavoura(String lavouraId) async {
    try {
      // Referência ao documento da lavoura
      var lavouraDocRef = FirebaseFirestore.instance.collection('lavouras').doc(lavouraId);

      // Referência à subcoleção 'aplicacoes'
      var aplicacoesCollectionRef = lavouraDocRef.collection('aplicacoes');

      // Obter todos os documentos na subcoleção 'aplicacoes'
      var aplicacoesSnapshot = await aplicacoesCollectionRef.get();

      // Excluir cada documento na subcoleção 'aplicacoes'
      for (var doc in aplicacoesSnapshot.docs) {
        await doc.reference.delete();
      }

      // Agora exclua o documento principal da lavoura
      await lavouraDocRef.delete();

      // Navegar para a página inicial após a exclusão bem-sucedida
      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));

      mostrarSnackBar(context: context, texto: 'Lavoura excluída com sucesso!', isErro: false);
    } catch (e) {
      mostrarSnackBar2(context: context, texto: 'Erro ao deletar lavoura: $e', isErro: true);
    }
  }
}

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
    _fetchPolygonPoints();
    data = widget.lavoura.data() as Map<String, dynamic>;
    idLavoura = widget.lavoura.id;
  }

  List<LatLng> polygonPoints = [];
  final MapController _mapController = MapController();

  Future<void> _fetchPolygonPoints() async {
    try {
      var data = widget.lavoura.data() as Map<String, dynamic>;
      if (data.containsKey('polygon')) {
        List<dynamic> points = data['polygon'];
        setState(() {
          polygonPoints = points.map((point) => LatLng(point['lat'], point['lng'])).toList();
        });
        _fitPolygonBounds();
      }
    } catch (e) {
      print('Erro ao buscar pontos do polígono: $e');
    }
  }

  void _fitPolygonBounds() {
    if (polygonPoints.isNotEmpty) {
      var bounds = LatLngBounds(polygonPoints[0], polygonPoints[0]);
      for (var point in polygonPoints) {
        bounds.extend(point);
      }
      _mapController.fitBounds(
        bounds,
        options: FitBoundsOptions(padding: EdgeInsets.all(20)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: polygonPoints.isNotEmpty ? polygonPoints[0] : LatLng(0, 0),
                    zoom: 15,
                    onMapReady: _fitPolygonBounds,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: [
                        'a',
                        'b',
                        'c'
                      ],
                    ),
                    if (polygonPoints.isNotEmpty)
                      PolygonLayer(
                        polygons: [
                          Polygon(
                            points: polygonPoints,
                            color: Colors.blue.withOpacity(0.3),
                            borderStrokeWidth: 2,
                            borderColor: Colors.blue,
                            isFilled: true,
                          ),
                        ],
                      ),
                  ],
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
      var lavouraDocRef = FirebaseFirestore.instance.collection('lavouras').doc(lavouraId);
      var aplicacoesCollectionRef = lavouraDocRef.collection('aplicacoes');
      var aplicacoesSnapshot = await aplicacoesCollectionRef.get();

      for (var doc in aplicacoesSnapshot.docs) {
        await doc.reference.delete();
      }
      await lavouraDocRef.delete();
      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));

      mostrarSnackBar(context: context, texto: 'Lavoura excluída com sucesso!', isErro: false);
    } catch (e) {
      mostrarSnackBar2(context: context, texto: 'Erro ao deletar lavoura: $e', isErro: true);
    }
  }
}

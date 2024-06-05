import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class mapsPage extends StatefulWidget {
  final Function(List<LatLng>) onPolygonDrawn;

  const mapsPage({super.key, required this.onPolygonDrawn});

  @override
  State<mapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<mapsPage> {
  List<LatLng> polygonPoints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Mapa',
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
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(51.509364, -0.128928),
              zoom: 9.2,
              onTap: (tapPosition, point) {
                setState(() {
                  polygonPoints.add(point);
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              PolygonLayer(
                polygonCulling: false,
                polygons: [
                  Polygon(
                    points: polygonPoints,
                    color: Colors.blue.withOpacity(0.5),
                    borderStrokeWidth: 2,
                    borderColor: Colors.blue,
                    isFilled: true,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onPolygonDrawn(polygonPoints);
          Navigator.of(context).pop();
        },
        child: Icon(Icons.save),
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
      ),
    );
  }
}

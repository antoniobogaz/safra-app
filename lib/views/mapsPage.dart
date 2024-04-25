import 'package:flutter/material.dart';

class mapsPage extends StatefulWidget {
  const mapsPage({super.key});

  @override
  State<mapsPage> createState() => _mapsPageState();
}

@override
class _mapsPageState extends State<mapsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Mapeamento Geográfico',
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
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,
                              color: Color.fromARGB(255, 8, 46, 28)),
                          border: InputBorder.none,
                          labelText: 'Pesquisar Localização do Talhão',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                  child: Container(
                    child: InkWell(
                      onTap: () {},
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
                            'selecionar local'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

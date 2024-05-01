import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/mapsPage.dart';
import 'package:flutter_safraapp/servicos/lista_de_valores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class cadernoCampoPage extends StatefulWidget {
  const cadernoCampoPage({super.key});

  @override
  State<cadernoCampoPage> createState() => _cadernoCampoPageState();
}

@override
class _cadernoCampoPageState extends State<cadernoCampoPage> {
  String? _selectedValue_classe;
  String? _selectedValue_toxicidade;
  String? _selectedValue_opcoesmedidas;
  String? _selectedValue_medidatempo;
  String? _selectedValue_medidaterreno;
  String? _selectedValue_sistemaPlantio;

  final _nomePropriedade = TextEditingController();
  final _tamanhoPropriedade = TextEditingController();
  final _cultura = TextEditingController();
  final _variedade = TextEditingController();
  final _dataPlantio = MaskedTextController(mask: '00/00/0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Caderno de Campo',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        automaticallyImplyLeading: true,
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
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Identificação do Talhão',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  controller: _nomePropriedade,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Nome da Propriedade',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 5.5),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.52,
                    height: 50,
                    child: TextField(
                      controller: _tamanhoPropriedade,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Tamanho da Área',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.95,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                    child: DropdownButton(
                      value: _selectedValue_medidaterreno,
                      isExpanded: true,
                      hint: const Text(
                        'Medida',
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 46, 28),
                        ),
                      ),
                      items: medidas_terreno.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue_medidaterreno = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  controller: _cultura,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Cultura',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  controller: _variedade,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Variedade',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: 50,
                    child: TextField(
                      controller: _dataPlantio,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Data de Plantio',
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
                SizedBox(width: 5.5),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                    child: DropdownButton(
                      value: _selectedValue_sistemaPlantio,
                      isExpanded: true,
                      hint: const Text(
                        'Sistema de Plantio',
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 46, 28),
                        ),
                      ),
                      items: sistema_plantio
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue_sistemaPlantio = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Mapeamento Geográfico',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => mapsPage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(
                          color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                  child: Center(
                    child: Text('Google Maps'),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Latitude',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(width: 5.5),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Longitude',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Aplicação',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Nome do Produto',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                child: DropdownButton(
                  value: _selectedValue_classe,
                  isExpanded: true,
                  hint: const Text(
                    'Alvo Biológico',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: opcoes_classe_agronomica.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_classe = newValue;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                child: DropdownButton(
                  value: _selectedValue_toxicidade,
                  isExpanded: true,
                  hint: const Text(
                    'Nível de Toxicidade',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: opcoes_nivel_toxicologico
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_toxicidade = newValue;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.95,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Data da Aplicação',
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
                SizedBox(width: 5.5),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3.25,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Dose Aplicada',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.95,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                    child: DropdownButton(
                      value: _selectedValue_opcoesmedidas,
                      isExpanded: true,
                      hint: const Text(
                        'Medida',
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 46, 28),
                        ),
                      ),
                      items: opcoes_medidas.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue_opcoesmedidas = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Método de Aplicação',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Responsável pela Aplicação',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 5.5),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.52,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Período de Carência',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.95,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                    child: DropdownButton(
                      value: _selectedValue_medidatempo,
                      isExpanded: true,
                      hint: const Text(
                        'Medida',
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 46, 28),
                        ),
                      ),
                      items: medidas_tempo.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue_medidatempo = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Observações',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: InkWell(
                onTap: () => _aoSalvarLavoura(context),
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
                      'salvar'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _aoSalvarLavoura(BuildContext context) {
    var colecao = FirebaseFirestore.instance.collection('lavouras');
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var novoDocumento = colecao.doc();
    colecao
        .doc()
        .set({
          'nomePropriedade': _nomePropriedade.text,
          'tamanhoArea': _tamanhoPropriedade.text,
          'medidaArea': _selectedValue_medidaterreno,
          'cultura': _cultura.text,
          'variedade': _variedade.text,
          'dataPlantio': _dataPlantio.text,
          'sistemaPlantio': _selectedValue_sistemaPlantio,
          'uid': uid,
          'idLavoura': novoDocumento.id
        })
        .then((value) => mostrarSnackBar(
            context: context, texto: "Dados Salvos com Sucesso", isErro: false))
        .catchError((error) => mostrarSnackBar(
            context: context,
            texto: "Algo deu errado. Tente Novamente. Erro: $error",
            isErro: true));
  }
}

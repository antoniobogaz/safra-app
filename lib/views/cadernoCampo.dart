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
  String? _selectedValue_metodoAplicacao;

  final _nomePropriedade = TextEditingController();
  final _tamanhoPropriedade = TextEditingController();
  final _cultura = TextEditingController();
  final _variedade = TextEditingController();
  final _dataPlantio = MaskedTextController(mask: '00/00/0000');

  final _nomeProduto = TextEditingController();
  final _dataAplicacao = MaskedTextController(mask: '00/00/0000');
  final _doseAplicada = TextEditingController();
  final _responsavelAplicacao = TextEditingController();
  final _periodoCarencia = TextEditingController();
  final _medidaCarencia = TextEditingController();
  final _observacaoAplicacao = TextEditingController();

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
                  controller: _nomeProduto,
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
                      controller: _dataAplicacao,
                      keyboardType: TextInputType.number,
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
                      controller: _doseAplicada,
                      keyboardType: TextInputType.number,
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
                  value: _selectedValue_metodoAplicacao,
                  isExpanded: true,
                  hint: const Text(
                    'Método de Aplicação',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: metodo_aplicacao
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_metodoAplicacao = newValue;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  controller: _responsavelAplicacao,
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
                      controller: _periodoCarencia,
                      keyboardType: TextInputType.number,
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
                  controller: _observacaoAplicacao,
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

  void limparFormulario() {
    setState(() {
      // Definindo como null para limpar a seleção
      _selectedValue_classe = null;
      _selectedValue_toxicidade = null;
      _selectedValue_opcoesmedidas = null;
      _selectedValue_metodoAplicacao = null;
      _selectedValue_medidatempo = null;
    });
  }

  void _aoSalvarLavoura(BuildContext context) {
    var colecao = FirebaseFirestore.instance.collection('lavouras');
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var novoDocumento = colecao.doc();

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(novoDocumento, {
        'nomePropriedade': _nomePropriedade.text,
        'tamanhoArea': _tamanhoPropriedade.text,
        'medidaArea': _selectedValue_medidaterreno,
        'cultura': _cultura.text,
        'variedade': _variedade.text,
        'dataPlantio': _dataPlantio.text,
        'sistemaPlantio': _selectedValue_sistemaPlantio,
        'uid': uid,
        'idLavoura': novoDocumento.id
      });

      // Criação da subcoleção "aplicacoes" para a lavoura
      var aplicacaoDoc = novoDocumento.collection('aplicacoes').doc();
      transaction.set(aplicacaoDoc, {
        'nomeProduto': _nomeProduto.text,
        'alvoBiologico': _selectedValue_classe,
        'nivelToxicidade': _selectedValue_toxicidade,
        'dataAplicacao': _dataAplicacao.text,
        'doseAplicada': _doseAplicada.text,
        'medidaDose': _selectedValue_opcoesmedidas,
        'metodoAplicacao': _selectedValue_metodoAplicacao,
        'responsavelAplicacao': _responsavelAplicacao.text,
        'periodoCarencia': _periodoCarencia.text,
        'medidaCarencia': _selectedValue_medidatempo,
        'observacaoAplicacao': _observacaoAplicacao.text,
      });
    }).then((value) {
      mostrarSnackBar(
          context: context, texto: "Dados Salvos com Sucesso", isErro: false);
      // Limpar os controllers após o uso
      _nomeProduto.clear();
      _dataAplicacao.clear();
      _doseAplicada.clear();
      _responsavelAplicacao.clear();
      _periodoCarencia.clear();
      _observacaoAplicacao.clear();
      limparFormulario();
    }).catchError((error) {
      mostrarSnackBar(
          context: context, texto: "Erro ao salvar: $error", isErro: true);
    });
  }

  void adicionarAplicacao(String idLavoura) {
    var aplicacoesRef = FirebaseFirestore.instance
        .collection('lavouras')
        .doc(idLavoura)
        .collection('aplicacoes');

    // Cria um novo documento na subcollection "aplicacoes"
    var novaAplicacao = aplicacoesRef.doc();

    novaAplicacao.set({
      'nomeProduto': _nomeProduto.text,
      'alvoBiologico': _selectedValue_classe,
      'nivelToxicidade': _selectedValue_toxicidade,
      'dataAplicacao': _dataAplicacao.text,
      'doseAplicada': _doseAplicada.text,
      'medidaDose': _selectedValue_opcoesmedidas,
      'metodoAplicacao': _selectedValue_metodoAplicacao,
      'responsavelAplicacao': _responsavelAplicacao.text,
      'periodoCarencia': _periodoCarencia.text,
      'medidaCarencia': _selectedValue_medidatempo,
      'observacaoAplicacao': _observacaoAplicacao.text,
      // outros campos conforme necessário
    }).then((value) {
      mostrarSnackBar(
          context: context,
          texto: "Aplicação adicionada com sucesso!",
          isErro: false);
    }).catchError((error) {
      mostrarSnackBar(
          context: context,
          texto: "Erro ao adicionar aplicação: $error",
          isErro: true);
    });
  }
}

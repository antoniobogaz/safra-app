import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_safraapp/servicos/lista_de_valores.dart';
import 'package:flutter_safraapp/views/mapsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editLavouraPage extends StatefulWidget {
  final String idLavoura;

  editLavouraPage({
    Key? key,
    required this.idLavoura,
  }) : super(key: key);

  @override
  State<editLavouraPage> createState() => _editLavouraPageState();
}

@override
class _editLavouraPageState extends State<editLavouraPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedValue_medidaterreno;
  String? _selectedValue_sistemaPlantio;

  final _nomePropriedade = TextEditingController();
  final _tamanhoPropriedade = TextEditingController();
  final _cultura = TextEditingController();
  final _variedade = TextEditingController();
  final _dataPlantio = MaskedTextController(mask: '00/00/0000');

  @override
  void initState() {
    super.initState();
    _loadLavouraData();
  }

  Future<void> _loadLavouraData() async {
    try {
      DocumentSnapshot lavouraDoc = await FirebaseFirestore.instance
          .collection('lavouras')
          .doc(widget.idLavoura)
          .get();

      if (lavouraDoc.exists) {
        Map<String, dynamic> lavouraData =
            lavouraDoc.data() as Map<String, dynamic>;

        setState(() {
          _nomePropriedade.text = lavouraData['nomePropriedade'];
          _tamanhoPropriedade.text = lavouraData['tamanhoArea'];
          _cultura.text = lavouraData['cultura'];
          _variedade.text = lavouraData['variedade'];
          _dataPlantio.text = lavouraData['dataPlantio'];
          _selectedValue_medidaterreno = lavouraData['medidaArea'];
          _selectedValue_sistemaPlantio = lavouraData['sistemaPlantio'];
        });
      }
    } catch (e) {
      print('Erro ao carregar dados da lavoura: $e');
    }
  }

  Future<void> _updateLavoura() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance
            .collection('lavouras')
            .doc(widget.idLavoura)
            .update({
          'nomePropriedade': _nomePropriedade.text,
          'tamanhoArea': _tamanhoPropriedade.text,
          'cultura': _cultura.text,
          'variedade': _variedade.text,
          'dataPlantio': _dataPlantio.text,
          'medidaArea': _selectedValue_medidaterreno,
          'sistemaPlantio': _selectedValue_sistemaPlantio,
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Lavoura atualizada com sucesso!'),
          backgroundColor: Colors.green,
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao atualizar lavoura: $e'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Editar Talhão',
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
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 2, 89, 47),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Identificação',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  child: TextFormField(
                    controller: _nomePropriedade,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Nome da Propriedade',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    },
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
                      child: TextFormField(
                        controller: _tamanhoPropriedade,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Tamanho da Área',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28)),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, informe o tamanho da área';
                          }
                          return null;
                        },
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
                              color: Color.fromARGB(255, 8, 46, 28),
                              width: 1.5)),
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
                  child: TextFormField(
                    controller: _cultura,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Cultura',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a cultura cultivada neste talhão';
                      }
                      return null;
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
                    controller: _variedade,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Variedade',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.25,
                      height: 50,
                      child: TextFormField(
                        controller: _dataPlantio,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Data de Plantio',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28)),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira a data de plantio';
                          }
                          return null;
                        },
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
                              color: Color.fromARGB(255, 8, 46, 28),
                              width: 1.5)),
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
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28)),
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
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28)),
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
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: InkWell(
                  onTap: () => _updateLavoura(),
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
                        'editar'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/mapsPage.dart';

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

  final List<String> _opcoes_medidas = [
    '',
    'L/ha',
    'Kg/ha',
    'mL/ha',
    'g/ha',
    'mL/L',
    'g/L',
    'UI/ha',
    'gotas/m2',
  ];

  final List<String> _medidas_tempo = [
    '',
    'Hora(s)',
    'Dia(s)',
    'Semana(s)',
    'Mes(es)',
    'Bimestre(s)',
    'Trimestre(s)',
    'Semestre(s)',
    'Ano(s)',
  ];

  final List<String> _opcoes_classe_agronomica = [
    '',
    'Acaricida',
    'Fungicida',
    'Herbicida',
    'Inseticida',
    'Nematicida',
  ];

  final List<String> _opcoes_nivel_toxicologico = [
    '',
    'Categoria 1 - Extremamente Tóxico',
    'Categoria 2 - Altamente Tóxico',
    'Categoria 3 - Moderadamente Tóxico',
    'Categoria 4 - Pouco Tóxico',
    'Categoria 5 - Improvável de Causar Dano Agudo',
    'Não Classificado',
  ];

  final List<String> _medidas_terreno = [
    '',
    'Hectare(s)',
    'Alqueire(s) Paulista',
    'Alqueire(s) Mineiro',
  ];

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
                      items: _medidas_terreno.map<DropdownMenuItem<String>>(
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.25,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Sistema de Plantio',
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
                  items:
                      _opcoes_classe_agronomica.map<DropdownMenuItem<String>>(
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
                  items: _opcoes_nivel_toxicologico
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
                      items: _opcoes_medidas.map<DropdownMenuItem<String>>(
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
                      items: _medidas_tempo.map<DropdownMenuItem<String>>(
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
}

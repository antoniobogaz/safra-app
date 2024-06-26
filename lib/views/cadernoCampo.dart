import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/mapsPage.dart';
import 'package:flutter_safraapp/servicos/lista_de_valores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:latlong2/latlong.dart';

class cadernoCampoPage extends StatefulWidget {
  final String? idLavoura_Parametro;
  final String? nomePropriedade;
  final String? tamanhoArea;
  final String? medidaArea;
  final String? cultura;
  final String? variedade;
  final String? dataPlantio;
  final String? sistemaPlantio;

  cadernoCampoPage({
    Key? key,
    required this.idLavoura_Parametro,
    this.nomePropriedade,
    this.tamanhoArea,
    this.medidaArea,
    this.cultura,
    this.variedade,
    this.dataPlantio,
    this.sistemaPlantio,
  }) : super(key: key);

  @override
  State<cadernoCampoPage> createState() => _cadernoCampoPageState();
}

@override
class _cadernoCampoPageState extends State<cadernoCampoPage> {
  var formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  List<LatLng> polygonPoints = [];
  String? polygonMessage;

  void _abrirMapa() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => mapsPage(onPolygonDrawn: (points) {
          setState(() {
            polygonPoints = points;
            polygonMessage = 'Mapeamento do Talhão cadastrado com sucesso!';
          });
        }),
      ),
    );
  }

  String? _selectedValue_classe = 'Acaricida';
  String? _selectedValue_toxicidade = 'Categoria 1 - Extremamente Tóxico';
  String? _selectedValue_opcoesmedidas = 'L/ha';
  String? _selectedValue_medidatempo = 'Hora(s)';
  String? _selectedValue_medidaterreno = 'Hectare(s)';
  String? _selectedValue_sistemaPlantio = 'Plantio Convencional';
  String? _selectedValue_metodoAplicacao = 'Pulverização Terrestre';

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
  final _observacaoAplicacao = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.idLavoura_Parametro != null) {
      _nomePropriedade.text = widget.nomePropriedade ?? '';
      _tamanhoPropriedade.text = widget.tamanhoArea ?? '';
      _cultura.text = widget.cultura ?? '';
      _variedade.text = widget.variedade ?? '';
      _dataPlantio.text = widget.dataPlantio ?? '';
      _selectedValue_medidaterreno = widget.medidaArea;
      _selectedValue_sistemaPlantio = widget.sistemaPlantio;
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Form(
                key: formKey,
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
                        child: TextFormField(
                          controller: _nomePropriedade,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'Nome da Propriedade',
                              labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                                  labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                                border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
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
                              labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                              labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                                  labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                                border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                            child: DropdownButton(
                              value: _selectedValue_sistemaPlantio,
                              isExpanded: true,
                              hint: const Text(
                                'Sistema de Plantio',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 8, 46, 28),
                                ),
                              ),
                              items: sistema_plantio.map<DropdownMenuItem<String>>((String value) {
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
                    Container(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          _abrirMapa();
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 2, 89, 47),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Demarcar Talhão'.toUpperCase(),
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (polygonMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          polygonMessage!,
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
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
                        child: TextFormField(
                          controller: _nomeProduto,
                          decoration: InputDecoration(
                              labelText: 'Nome do Produto',
                              labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe o nome do produto a ser aplicado';
                            }
                            return null;
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
                            border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
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
                            border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                        child: DropdownButton(
                          value: _selectedValue_toxicidade,
                          isExpanded: true,
                          hint: const Text(
                            'Nível de Toxicidade',
                            style: TextStyle(
                              color: Color.fromARGB(255, 8, 46, 28),
                            ),
                          ),
                          items: opcoes_nivel_toxicologico.map<DropdownMenuItem<String>>((String value) {
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
                            child: TextFormField(
                              controller: _dataAplicacao,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Data da Aplicação',
                                  labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                    borderRadius: BorderRadius.circular(50),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, informe a data da Aplicação';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 5.5),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3.25,
                            height: 50,
                            child: TextFormField(
                              controller: _doseAplicada,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Dose Aplicada',
                                  labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, insira a dose aplicada';
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
                                border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
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
                            border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                        child: DropdownButton(
                          value: _selectedValue_metodoAplicacao,
                          isExpanded: true,
                          hint: const Text(
                            'Método de Aplicação',
                            style: TextStyle(
                              color: Color.fromARGB(255, 8, 46, 28),
                            ),
                          ),
                          items: metodo_aplicacao.map<DropdownMenuItem<String>>((String value) {
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
                        child: TextFormField(
                          controller: _responsavelAplicacao,
                          decoration: InputDecoration(
                              labelText: 'Responsável pela Aplicação',
                              labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira o responsável por esta aplicação';
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
                              controller: _periodoCarencia,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Período de Carência',
                                  labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Por favor, insira o período de carência";
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
                                border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
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
                              labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void limparFormulario() {
    setState(() {
      _selectedValue_classe = null;
      _selectedValue_toxicidade = null;
      _selectedValue_opcoesmedidas = null;
      _selectedValue_metodoAplicacao = null;
      _selectedValue_medidatempo = null;
    });
  }

  void _aoSalvarLavoura(BuildContext context) {
    if (formKey.currentState!.validate()) {
      var colecao = FirebaseFirestore.instance.collection('lavouras');
      var uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentReference novoDocumento;

      bool novaLavoura = widget.idLavoura_Parametro == null;
      if (novaLavoura) {
        novoDocumento = colecao.doc();
      } else {
        novoDocumento = colecao.doc(widget.idLavoura_Parametro);
      }

      FirebaseFirestore.instance.runTransaction((transaction) async {
        if (novaLavoura) {
          transaction.set(novoDocumento, {
            'nomePropriedade': _nomePropriedade.text,
            'tamanhoArea': _tamanhoPropriedade.text,
            'medidaArea': _selectedValue_medidaterreno,
            'cultura': _cultura.text,
            'variedade': _variedade.text,
            'dataPlantio': _dataPlantio.text,
            'sistemaPlantio': _selectedValue_sistemaPlantio,
            'uid': uid,
            'idLavoura': novoDocumento.id,
            'polygon': polygonPoints
                .map((point) => {
                      'lat': point.latitude,
                      'lng': point.longitude
                    })
                .toList(),
          });
        }

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
          'idLavoura': novoDocumento.id,
          'idAplicacao': aplicacaoDoc.id,
          'uid': uid
        });
      }).then((value) {
        mostrarSnackBar(context: context, texto: "Dados Salvos com Sucesso", isErro: false);
        _nomeProduto.clear();
        _dataAplicacao.clear();
        _doseAplicada.clear();
        _responsavelAplicacao.clear();
        _periodoCarencia.clear();
        _observacaoAplicacao.clear();
        limparFormulario();

        /*if (novaLavoura) {
          Navigator.of(context).pop(true);
        }*/
      }).catchError((error) {
        mostrarSnackBar(context: context, texto: "Erro ao salvar: $error", isErro: true);
      });
    } else {
      mostrarSnackBar2(context: context, texto: 'Preencha os campos obrigatórios');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_safraapp/servicos/lista_de_valores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editAplicacaoPage extends StatefulWidget {
  final String idLavoura;
  final String idAplicacao;

  editAplicacaoPage({
    Key? key,
    required this.idLavoura,
    required this.idAplicacao,
  }) : super(key: key);

  @override
  State<editAplicacaoPage> createState() => _editAplicacaoPageState();
}

@override
class _editAplicacaoPageState extends State<editAplicacaoPage> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedValue_opcoesmedidas;
  String? _selectedValue_medidatempo;
  String? _selectedValue_classe;
  String? _selectedValue_metodoAplicacao;
  String? _selectedValue_toxicidade;

  final _nomeProduto = TextEditingController();
  final _dataAplicacao = MaskedTextController(mask: '00/00/0000');
  final _doseAplicada = TextEditingController();
  final _responsavelAplicacao = TextEditingController();
  final _periodoCarencia = TextEditingController();
  final _observacaoAplicacao = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadAplicacaoData(widget.idLavoura, widget.idAplicacao);
  }

  Future<void> _loadAplicacaoData(String lavouraId, String aplicacaoId) async {
    try {
      DocumentSnapshot aplicacaoDoc = await FirebaseFirestore.instance
          .collection('lavouras')
          .doc(lavouraId)
          .collection('aplicacoes')
          .doc(aplicacaoId)
          .get();

      if (aplicacaoDoc.exists) {
        Map<String, dynamic> aplicacaoData =
            aplicacaoDoc.data() as Map<String, dynamic>;

        setState(() {
          _nomeProduto.text = aplicacaoData['nomeProduto'];
          _dataAplicacao.text = aplicacaoData['dataAplicacao'];
          _doseAplicada.text = aplicacaoData['doseAplicada'];
          _responsavelAplicacao.text = aplicacaoData['responsavelAplicacao'];
          _periodoCarencia.text = aplicacaoData['periodoCarencia'];
          _observacaoAplicacao.text = aplicacaoData['observacaoAplicacao'];
          _selectedValue_opcoesmedidas = aplicacaoData['medidaDose'];
          _selectedValue_medidatempo = aplicacaoData['medidaCarencia'];
          _selectedValue_classe = aplicacaoData['alvoBiologico'];
          _selectedValue_metodoAplicacao = aplicacaoData['metodoAplicacao'];
          _selectedValue_toxicidade = aplicacaoData['nivelToxicidade'];
        });
      }
    } catch (e) {
      print('Erro ao carregar dados da lavoura: $e');
    }
  }

  void _popThreePages(BuildContext context) {
    int count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == 3;
    });
  }

  Future<void> updateAplicacao(String lavouraId, String aplicacaoId) async {
    try {
      await FirebaseFirestore.instance
          .collection('lavouras')
          .doc(widget.idLavoura)
          .collection('aplicacoes')
          .doc(widget.idAplicacao)
          .update({
        'alvoBiologico': _selectedValue_classe,
        'dataAplicacao': _dataAplicacao.text,
        'doseAplicada': _doseAplicada.text,
        'medidaCarencia': _selectedValue_medidatempo,
        'medidaDose': _selectedValue_opcoesmedidas,
        'metodoAplicacao': _selectedValue_metodoAplicacao,
        'nivelToxicidade': _selectedValue_toxicidade,
        'nomeProduto': _nomeProduto.text,
        'observacaoAplicacao': _observacaoAplicacao.text,
        'periodoCarencia': _periodoCarencia.text,
        'responsavelAplicacao': _responsavelAplicacao.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Aplicação atualizada com sucesso!'),
        backgroundColor: Colors.green,
      ));
      _popThreePages(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao atualizar aplicacao: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      'Editar Aplicação',
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
                    controller: _nomeProduto,
                    decoration: InputDecoration(
                        labelText: 'Nome do Produto',
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
                        opcoes_classe_agronomica.map<DropdownMenuItem<String>>(
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
                      child: TextFormField(
                        controller: _dataAplicacao,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Data da Aplicação',
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
                          border: Border.all(
                              color: Color.fromARGB(255, 8, 46, 28),
                              width: 1.5)),
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
                  child: TextFormField(
                    controller: _responsavelAplicacao,
                    decoration: InputDecoration(
                        labelText: 'Responsável pela Aplicação',
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
                          border: Border.all(
                              color: Color.fromARGB(255, 8, 46, 28),
                              width: 1.5)),
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
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: InkWell(
                  onTap: () =>
                      updateAplicacao(widget.idLavoura, widget.idAplicacao),
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
            ]))));
  }
}

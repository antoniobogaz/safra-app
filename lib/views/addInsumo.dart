import 'package:flutter/material.dart';

class addInsumoPage extends StatefulWidget {
  const addInsumoPage({super.key});
  @override
  State<addInsumoPage> createState() => _addInsumoPageState();
}

@override
class _addInsumoPageState extends State<addInsumoPage> {
  String? _selectedValue_classe;
  String? _selectedValue_toxicidade;
  String? _selectedValue_ambiental;
  String? _selectedValue_inflamavel;
  String? _selectedValue_corrosivo;
  String? _selectedValue_formulacao;

  final List<String> _opcoes_classe_agronomica = [
    'Acaricida',
    'Bactericida',
    'Fungicida',
    'Herbicida',
    'Inseticida',
    'Rodenticida',
  ];

  final List<String> _opcoes_nivel_toxicologico = [
    'Produto Extremamente Tóxico',
    'Produto Altamente Tóxico',
    'Produto Moderadamente Tóxico',
    'Produto Pouco Tóxico',
    'Produto Improvável de Causar Dano Agudo',
    'Produto Não Classificado',
    'Não Informado',
    'Produtos Cujo Processo Matriz Não Foi Localizado',
  ];

  final List<String> _opcoes_nivel_ambiental = [
    'Produto Altamente Perigoso',
    'Produto Muito Perigoso',
    'Produto Perigoso',
    'Produto Pouco Perigoso',
  ];

  final List<String> _opcoes_nivel_inflamavel = [
    'Inflamável',
    'Não Inflamável'
  ];

  final List<String> _opcoes_nivel_formulacao = [
    'Bloco ',
    'Concentrado Dispersível ',
    'Concentrado Emulsionável ',
    'Concentrado Solúvel ',
    'Dispersão De Óleo Ou Suspensão Concentrada Em Óleo ',
    'Emulsão De Água Em Óleo ',
    'Emulsão De Óleo Em Água ',
    'Formulação Mista De Cs E Ew',
    'Formulação Mista De Cs E Sc ',
    'Formulação Mista De Cs E Se',
    'Gel Emulsionável ',
    'Gel Solúvel Em Água ',
    'Gelou Concentrado Em Pasta ',
    'Granulado ',
    'Granulado Dispersível ',
    'Granulado Encapsulado ',
    'Granulado Fino ',
    'Granulado Solúvel ',
    'Grânulo Emulsionável ',
    'Líquido Para Pulverização Eletrostática/Eletrodinâmica ',
    'Macrogranulado ',
    'Microemulsão',
    'Microgranulado ',
    'Óleo Para Pulverização/Espalhamento ',
    'Pó De Contato ',
    'Pó Dispersível Em Óleo ',
    'Pó Emulsionável ',
    'Pó Fino ',
    'Pó Molhável ',
    'Pó Seco ',
    'Pó Solúvel ',
    'Solução Miscível Em Óleo ',
    'Suspensão A Ultrabaixo Volume ',
    'Suspensão Concentrada ',
    'Suspensão Concentrada Dispersível Ou Miscível Em Óleo ',
    'Suspensão De Encapsulado ',
    'Suspo-Emulsão',
    'Tablete ',
    'Tablete Para Aplicação Direta ',
    'Tablete Para Dispersão Em Água ',
    'Tablete Para Dissolução Em Água ',
    'Ultrabaixo Volume ',
  ];

  final List<String> _opcoes_nivel_corrosivo = ['Corrosivo', 'Não Corrosivo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*title: Text(
          'Adicionar Insumo',
          style: TextStyle(fontSize: 22),
        ),*/
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Color.fromARGB(255, 2, 89, 47),
              ),
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 10),
                child: Center(
                  child: Text(
                    'Cadastrar Insumo'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome do insumo',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 50,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome Técnico do Insumo',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Registro ANVISA',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Empresa Fabricante',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Ingrediente Ativo',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                child: DropdownButton(
                  value: _selectedValue_classe,
                  isExpanded: true,
                  hint: const Text(
                    'Classe Agronômica',
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                child: DropdownButton(
                  value: _selectedValue_ambiental,
                  isExpanded: true,
                  hint: const Text(
                    'Potenciais de Periculosidade Ambiental',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: _opcoes_nivel_ambiental
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_ambiental = newValue;
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                child: DropdownButton(
                  value: _selectedValue_inflamavel,
                  isExpanded: true,
                  hint: const Text(
                    'Inflamabilidade',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: _opcoes_nivel_inflamavel
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_inflamavel = newValue;
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                child: DropdownButton(
                  value: _selectedValue_corrosivo,
                  isExpanded: true,
                  hint: const Text(
                    'Corrosividade',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: _opcoes_nivel_corrosivo
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_corrosivo = newValue;
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                child: DropdownButton(
                  value: _selectedValue_formulacao,
                  isExpanded: true,
                  hint: const Text(
                    'Formulação',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: _opcoes_nivel_formulacao
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_formulacao = newValue;
                    });
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 70, bottom: 40),
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

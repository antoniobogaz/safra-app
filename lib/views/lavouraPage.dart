import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/mapsPage.dart';
import 'package:flutter_safraapp/servicos/autenticacao_servico.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';

class lavouraPage extends StatefulWidget {
  const lavouraPage({super.key});

  @override
  State<lavouraPage> createState() => _lavouraPageState();
}

@override
class _lavouraPageState extends State<lavouraPage> {
  AutenticacaoServico _autenServico = AutenticacaoServico();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Lavoura',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
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
      body: WillPopScope(
        onWillPop: () => _onBackButtonPressed(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        hintText: 'Nome da Lavoura',
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tipo de Cultura',
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Variedade da Cultura',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                              width: 2.0)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Data de Plantio',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28))),
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
                              width: 2.0)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Sistema de Plantio',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28))),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Informações Sobre o Solo',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tipo de Solo',
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nível de PH',
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Histórico de Cultivo',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Manejo da Lavoura',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Irrigação',
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Práticas de Manejo',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Produção e Colheita',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Estimativa de Produção',
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Data Prevista de Colheita',
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Produção Realizada',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0, left: 12),
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
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.25,
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topLeft: Radius.circular(50),
                          ),
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 8, 46, 28),
                              width: 2.0)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Latitude',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28))),
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
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 8, 46, 28),
                              width: 2.0)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Longitude',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28))),
                      ),
                    ),
                  ),
                ],
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
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Tem certeza?"),
            content: Text("Você deseja deslogar da sua conta?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("Não")),
              TextButton(
                  onPressed: () {
                    _metodologout();
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Sim"))
            ],
          );
        });

    return exitApp ?? false;
  }

  _metodologout() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 8, 46, 28)),
          ));
        });

    _autenServico.logout().then((String? erro) {
      if (erro != null) {
        Navigator.of(context).pop();
        mostrarSnackBar2(context: context, texto: erro);
      } else {
        //Deu certo
        Navigator.of(context).pop();
        mostrarSnackBar2(
            context: context, texto: "Deslogado com sucesso", isErro: false);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginPage()));
      }
    });
  }
}

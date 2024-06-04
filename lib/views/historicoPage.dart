import 'package:flutter/material.dart';
import 'package:flutter_safraapp/servicos/autenticacao_servico.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class historicoPage extends StatefulWidget {
  const historicoPage({Key? key}) : super(key: key);

  @override
  _historicoPageState createState() => _historicoPageState();
}

class _historicoPageState extends State<historicoPage> {
  AutenticacaoServico _autenServico = AutenticacaoServico();
  final user = FirebaseAuth.instance.currentUser!;

  Future<List<Aplicacao>> fetchAplicacoes() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collectionGroup('aplicacoes')
        .where('uid', isEqualTo: user.uid)
        .orderBy('dataAplicacao')
        .get();
    List<Aplicacao> aplicacoes = querySnapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      return Aplicacao(
        alvoBiologico: data['alvoBiologico'],
        dataAplicacao: data['dataAplicacao'],
        doseAplicada: data['doseAplicada'],
        medidaCarencia: data['medidaCarencia'],
        medidaDose: data['medidaDose'],
        metodoAplicacao: data['metodoAplicacao'],
        nivelToxicidade: data['nivelToxicidade'],
        nomeProduto: data['nomeProduto'],
        observacaoAplicacao: data['observacaoAplicacao'],
        periodoCarencia: data['periodoCarencia'],
        responsavelAplicacao: data['responsavelAplicacao'],
      );
    }).toList();

    // Ordenar a lista pela data de aplicação
    aplicacoes.sort((a, b) {
      DateTime dataA = DateFormat('dd/MM/yyyy').parse(a.dataAplicacao);
      DateTime dataB = DateFormat('dd/MM/yyyy').parse(b.dataAplicacao);
      return dataB.compareTo(dataA);
    });

    return aplicacoes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Visão Geral das Aplicações',
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
                  'images/Logo_SafraApp3.png',
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () => onBackButtonPressed(context),
        child: FutureBuilder<List<Aplicacao>>(
          future: fetchAplicacoes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text("Erro ao carregar dados: ${snapshot.error}"));
            }
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text("Não há aplicações registradas",
                    style: TextStyle(fontSize: 22, color: Colors.grey)),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var aplicacao = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.only(top: 1),
                  child: Container(
                    child: ListTile(
                        tileColor: Colors.white,
                        visualDensity: VisualDensity(vertical: 4),
                        title: Text(aplicacao.nomeProduto),
                        subtitle: Text(
                            'Aplicado por: ${aplicacao.responsavelAplicacao}\nAplicado em: ${aplicacao.dataAplicacao}'),
                        leading: Icon(
                          Icons.history_outlined,
                          color: Color.fromARGB(255, 2, 89, 47),
                          size: 35,
                        )),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> onBackButtonPressed(BuildContext context) async {
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

class Aplicacao {
  final String alvoBiologico;
  final String dataAplicacao;
  final String doseAplicada;
  final String medidaCarencia;
  final String medidaDose;
  final String metodoAplicacao;
  final String nivelToxicidade;
  final String nomeProduto;
  final String observacaoAplicacao;
  final String periodoCarencia;
  final String responsavelAplicacao;

  Aplicacao({
    required this.alvoBiologico,
    required this.dataAplicacao,
    required this.doseAplicada,
    required this.medidaCarencia,
    required this.medidaDose,
    required this.metodoAplicacao,
    required this.nivelToxicidade,
    required this.nomeProduto,
    required this.observacaoAplicacao,
    required this.periodoCarencia,
    required this.responsavelAplicacao,
  });

  factory Aplicacao.fromSnapshot(DocumentSnapshot doc) {
    return Aplicacao(
      alvoBiologico: doc['alvoBiologico'] ?? '',
      dataAplicacao: doc['dataAplicacao'] ?? '',
      doseAplicada: doc['doseAplicada'] ?? '',
      medidaCarencia: doc['medidaCarencia'] ?? '',
      medidaDose: doc['medidaDose'] ?? '',
      metodoAplicacao: doc['metodoAplicacao'] ?? '',
      nivelToxicidade: doc['nivelToxicidade'] ?? '',
      nomeProduto: doc['nomeProduto'] ?? '',
      observacaoAplicacao: doc['observacaoAplicacao'] ?? '',
      periodoCarencia: doc['periodoCarencia'] ?? '',
      responsavelAplicacao: doc['responsavelAplicacao'] ?? '',
    );
  }
}

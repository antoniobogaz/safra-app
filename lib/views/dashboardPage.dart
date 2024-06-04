import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/viewLavouraInsumo.dart';
import 'package:flutter_safraapp/servicos/autenticacao_servico.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';
import 'package:flutter_safraapp/views/cadernoCampo.dart';

class dashboardPage extends StatefulWidget {
  const dashboardPage({super.key});
  @override
  State<dashboardPage> createState() => _dashboardPageState();
}

@override
class _dashboardPageState extends State<dashboardPage> {
  var height, width;
  bool isLoading = true;
  AutenticacaoServico _autenServico = AutenticacaoServico();

  List<DocumentSnapshot> lavouras = [];

  void iniciarEscutaLavouras() {
    setState(() {
      isLoading = true;
    });

    var colecao = firestore
        .collection('lavouras')
        .where('uid', isEqualTo: user.uid)
        .orderBy('nomePropriedade');

    colecao.snapshots().listen((snapshot) {
      setState(() {
        lavouras = snapshot.docs;
        isLoading = false;
      });
    }, onError: (error) {
      setState(() {
        isLoading = false;
      });
      mostrarSnackBar(context: context, texto: "Erro ao consultar lavouras: $error", isErro: true);
    });
  }

  final user = FirebaseAuth.instance.currentUser!;
  final firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    iniciarEscutaLavouras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Olá, ${user.displayName}",
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
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cadernoCampoPage(
                                    idLavoura_Parametro: null,
                                  )));
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () => _onBackButtonPressed(context),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 2, 89, 47)),
                ),
              )
            : lavouras.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Nenhuma lavoura cadastrada!",
                            style: TextStyle(fontSize: 22, color: Colors.grey)),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => cadernoCampoPage(
                                          idLavoura_Parametro: null,
                                        )));
                          },
                          child: Text("Cadastrar Lavoura"),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 2, 89, 47), // Cor do botão
                          ),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: lavouras.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot lavoura = lavouras[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => viewLavouraInsumoPage(lavoura: lavoura)));
                        },
                        child: Card(
                          margin: EdgeInsets.only(top: 1),
                          child: ListTile(
                              tileColor: Colors.white,
                              title: Text(lavoura['nomePropriedade']),
                              subtitle:
                                  Text("Área: ${lavoura['tamanhoArea']} ${lavoura['medidaArea']}"),
                              trailing: const Icon(
                                Icons.arrow_forward,
                                color: Color.fromARGB(255, 2, 89, 47),
                              ),
                              leading: Icon(
                                Icons.eco_outlined,
                                color: Color.fromARGB(255, 2, 89, 47),
                              )),
                        ),
                      );
                    },
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
        mostrarSnackBar2(context: context, texto: "Deslogado com sucesso", isErro: false);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage()));
      }
    });
  }
}

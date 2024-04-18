import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/viewLavouraInsumo.dart';
import 'package:flutter_safraapp/servicos/autenticacao_servico.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';

class historicoPage extends StatefulWidget {
  const historicoPage({super.key});

  @override
  State<historicoPage> createState() => _historicoPageState();
}

@override
class _historicoPageState extends State<historicoPage> {
  AutenticacaoServico _autenServico = AutenticacaoServico();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Histórico de Aplicações',
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
        //automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () => _onBackButtonPressed(context),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => viewLavouraInsumoPage()));
            },
            child: Card(
              margin: EdgeInsets.only(top: 1),
              child: Container(
                //height: 130,
                child: ListTile(
                    tileColor: Colors.white,
                    visualDensity: VisualDensity(vertical: 4),
                    title: Text('Nome do insumo aplicado'),
                    subtitle: Text('Nome da Lavoura\nNome do Insumo Aplicado'),
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 2, 89, 47),
                    ),
                    leading: Icon(
                      Icons.history_outlined,
                      color: Color.fromARGB(255, 2, 89, 47),
                      size: 35,
                    )),
              ),
            ),
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

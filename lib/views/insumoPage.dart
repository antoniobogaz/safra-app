import 'package:flutter/material.dart';
import 'package:flutter_safraapp/servicos/autenticacao_servico.dart';
import 'package:flutter_safraapp/views/editInsumo.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';

class insumoPage extends StatefulWidget {
  const insumoPage({super.key});

  @override
  State<insumoPage> createState() => _insumoPageState();
}

@override
class _insumoPageState extends State<insumoPage> {
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
                'Insumos Utilizados',
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
          //automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 2, 89, 47),
          centerTitle: true,
        ),
        body: WillPopScope(
            onWillPop: () => _onBackButtonPressed(context),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: Card(
                  margin: EdgeInsets.only(top: 1),
                  child: ListTile(
                    tileColor: Colors.white,
                    //visualDensity: VisualDensity(vertical: 4),
                    title: Text('Nome do Insumo'),
                    subtitle: Text('Descrição'),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => editInsumoPage()));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 8, 46, 28),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 182, 19, 8),
                            )),
                      ],
                      /*leading: Icon(
                    Icons.water_drop_outlined,
                    color: Color.fromARGB(255, 2, 89, 47),
                  )),*/
                    ),
                  ),
                ),
              ),
            )));
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

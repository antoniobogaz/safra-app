import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/editAplicacao.dart';
import 'package:flutter_safraapp/views/listarAplicacoes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';

class viewAplicacaoPage extends StatefulWidget {
  //const viewAplicacaoPage({super.key});
  final Aplicacao aplicacao;

  const viewAplicacaoPage({Key? key, required this.aplicacao})
      : super(key: key);

  @override
  State<viewAplicacaoPage> createState() => _viewAplicacaoPageState();
}

@override
class _viewAplicacaoPageState extends State<viewAplicacaoPage> {
  late Aplicacao aplicacao;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Visualizar Aplicação',
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
                                builder: (context) => editAplicacaoPage(
                                      idLavoura: widget.aplicacao.lavouraId,
                                      idAplicacao: widget.aplicacao.aplicacaoId,
                                    )));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () => _confirmarExclusao(
                          context,
                          widget.aplicacao.lavouraId,
                          widget.aplicacao.aplicacaoId),
                      icon: Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 182, 19, 8),
                      ))
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.03,
                    //height: 300,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 8, 46, 28),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Text(
                              'Informações Registradas',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: 1,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Nome do Insumo Aplicado',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 15),
                              child: Text(
                                '${widget.aplicacao.nomeProduto}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Alvo Biológico do Defensivo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 15),
                              child: Text(
                                '${widget.aplicacao.alvoBiologico}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Nível de Toxicidade do Defensivo',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 15),
                              child: Text(
                                '${widget.aplicacao.nivelToxicidade}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Data da Aplicação',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 15),
                              child: Text(
                                '${widget.aplicacao.dataAplicacao}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Dose Aplicada',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 15),
                              child: Text(
                                '${widget.aplicacao.doseAplicada} ${widget.aplicacao.medidaDose}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Método de Aplicação',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 15),
                              child: Text(
                                '${widget.aplicacao.metodoAplicacao}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Responsável pela Aplicação',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 15),
                              child: Text(
                                '${widget.aplicacao.responsavelAplicacao}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Período de Carência',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1, left: 15),
                              child: Text(
                                '${widget.aplicacao.periodoCarencia} ${widget.aplicacao.medidaCarencia}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 15),
                              child: Text(
                                'Observações',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 1, left: 15, bottom: 50),
                              child: Text(
                                '${widget.aplicacao.observacaoAplicacao}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _confirmarExclusao(
      BuildContext context, String lavouraId, String aplicacaoId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar Exclusão"),
          content: Text("Tem certeza de que deseja excluir esta aplicação?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _excluirAplicacao(lavouraId, aplicacaoId);
              },
              child: Text("Excluir", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _excluirAplicacao(String lavouraId, String aplicacaoId) async {
    try {
      await FirebaseFirestore.instance
          .collection('lavouras')
          .doc(lavouraId)
          .collection('aplicacoes')
          .doc(aplicacaoId)
          .delete();
      Navigator.of(context).pop(true);
      mostrarSnackBar(
          context: context,
          texto: 'Aplicação excluída com sucesso',
          isErro: false);
    } catch (e) {
      mostrarSnackBar(
          context: context,
          texto: 'Erro ao excluir aplicação: $e',
          isErro: true);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/viewAplicacao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class listarAplicacoesPage extends StatefulWidget {
  final String lavouraId;

  const listarAplicacoesPage({super.key, required this.lavouraId});

  @override
  State<listarAplicacoesPage> createState() => _listarAplicacoesPageState();
}

class _listarAplicacoesPageState extends State<listarAplicacoesPage> {
  Future<List<Aplicacao>>? _futureAplicacoes;

  Future<List<Aplicacao>> fetchAplicacoes() async {
    var collection = FirebaseFirestore.instance.collection('lavouras').doc(widget.lavouraId).collection('aplicacoes');
    var snapshot = await collection.get();
    if (snapshot.docs.isEmpty) return [];
    return snapshot.docs.map((doc) => Aplicacao.fromFirestore(doc)).toList();
  }

  @override
  void initState() {
    super.initState();
    _futureAplicacoes = fetchAplicacoes();
  }

  Future<void> _refreshAplicacoes() async {
    setState(() {
      _futureAplicacoes = fetchAplicacoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Insumos Aplicados',
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
      body: FutureBuilder<List<Aplicacao>>(
        future: _futureAplicacoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados: ${snapshot.error}', style: TextStyle(fontSize: 22, color: Colors.grey)));
          }
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text("Não há aplicações registradas neste talhão", style: TextStyle(fontSize: 22, color: Colors.grey)),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var aplicacao = snapshot.data![index];
              return InkWell(
                onTap: () async {
                  bool? result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => viewAplicacaoPage(aplicacao: aplicacao),
                    ),
                  );
                  if (result == true) {
                    _refreshAplicacoes();
                  }
                },
                child: Card(
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(aplicacao.nomeProduto),
                    subtitle: Text('Aplicado em: ${aplicacao.dataAplicacao}'),
                    trailing: Icon(Icons.arrow_forward, color: Color.fromARGB(255, 2, 89, 47)),
                    leading: Icon(Icons.water_drop, color: Color.fromARGB(255, 2, 89, 47)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
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
  final String lavouraId;
  final String aplicacaoId;

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
    required this.lavouraId,
    required this.aplicacaoId,
  });

  factory Aplicacao.fromFirestore(DocumentSnapshot doc) {
    return Aplicacao(
      alvoBiologico: doc['alvoBiologico'],
      dataAplicacao: (doc['dataAplicacao']),
      doseAplicada: (doc['doseAplicada']),
      medidaCarencia: (doc['medidaCarencia']),
      medidaDose: (doc['medidaDose']),
      metodoAplicacao: (doc['metodoAplicacao']),
      nivelToxicidade: (doc['nivelToxicidade']),
      nomeProduto: (doc['nomeProduto']),
      observacaoAplicacao: (doc['observacaoAplicacao']),
      periodoCarencia: (doc['periodoCarencia']),
      responsavelAplicacao: (doc['responsavelAplicacao']),
      lavouraId: (doc['idLavoura']),
      aplicacaoId: (doc['idAplicacao']),
    );
  }
}

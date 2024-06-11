import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/editProfile.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:flutter_safraapp/servicos/autenticacao_servico.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

@override
class _profilePageState extends State<profilePage> {
  AutenticacaoServico _autenServico = AutenticacaoServico();
  var uid = FirebaseAuth.instance.currentUser!.uid;

  String? _downloadUrl;

  Future<void> _loadProfilePicture() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('usuarios').doc(uid).get();
      if (userDoc.exists) {
        setState(() {
          _downloadUrl = userDoc['profilePicture'];
        });
      }
    } catch (e) {
      print('Erro ao carregar a foto de perfil: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfilePicture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        backgroundColor: Colors.white,
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('usuarios').doc(uid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Algo deu errado');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            Map<String, dynamic> dados = snapshot.data!.data() as Map<String, dynamic>;
            String fullName = '${dados['nomeUsuario']} ${dados['sobrenome']}';
            String localidade = '${dados['cidade']}, ${dados['estado']}';
            return SingleChildScrollView(
              reverse: false,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                      color: Color.fromARGB(255, 2, 89, 47),
                    ),
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.red,
                            backgroundImage: _downloadUrl != null ? NetworkImage(_downloadUrl!) : null,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color.fromARGB(255, 8, 46, 28),
                                  width: 5.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            fullName,
                            style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            localidade,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: InkWell(
                          onTap: () {
                            _navegarparaEditProfile();
                          },
                          child: Container(
                            width: 380,
                            height: 50,
                            decoration: BoxDecoration(
                                //color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 2)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Editar Perfil',
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 251.0),
                                  child: Icon(Icons.arrow_forward_ios),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _metodologout();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                              width: 380,
                              height: 50,
                              decoration: BoxDecoration(color: Color.fromARGB(255, 182, 19, 8), borderRadius: BorderRadius.circular(20), border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 2)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Sair da Conta',
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 240.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ));
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

  void _navegarparaEditProfile() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection('usuarios').doc(user.uid).get().then((snapshot) {
        if (snapshot.exists) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => editProfilePage(
                nomeEmpresa: snapshot.data()?['nomeEmpresa'] ?? '',
                cnpj: snapshot.data()?['CNPJ'] ?? '',
                razaoSocial: snapshot.data()?['razaoSocial'] ?? '',
                nomeFantasia: snapshot.data()?['nomeFantasia'] ?? '',
                logradouro: snapshot.data()?['logradouro'] ?? '',
                cep: snapshot.data()?['CEP'] ?? '',
                complemento: snapshot.data()?['Complemento'] ?? '',
                cidade: snapshot.data()?['cidade'] ?? '',
                nome: snapshot.data()?['nomeUsuario'] ?? '',
                sobrenome: snapshot.data()?['sobrenome'] ?? '',
                cpf: snapshot.data()?['CPF'] ?? '',
                rg: snapshot.data()?['RG'] ?? '',
                email: snapshot.data()?['email'] ?? '',
                celular: snapshot.data()?['celular'] ?? '',
                estado: snapshot.data()?['estado'] ?? '',
                setor: snapshot.data()?['setor'] ?? '',
              ),
            ),
          );
        }
      });
    }
  }
}

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';

class forgotpassword extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  forgotpassword({super.key});

  void _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      mostrarSnackBar2(
          context: context,
          texto: 'Email Enviado! Verifique sua Caixa de Entrada',
          isErro: false);
    } catch (e) {
      print('Error: $e');
      mostrarSnackBar2(
          context: context,
          texto: 'Ocorreu um problema. Tente novamente',
          isErro: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Recuperação de Senha',
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
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 60),
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 8, 46, 28), width: 9),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.lock_person_outlined,
                    size: 100,
                    color: Color.fromARGB(255, 8, 46, 28),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Container(
                  child: Container(
                      child: Text(
                    'Redefinir Senha',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Container(
                  width: 350,
                  child: Text(
                    'Informe o e-mail para o qual deseja redefinir a sua senha.',
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 68.0),
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
                    controller: emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.mail,
                            color: Color.fromARGB(255, 8, 46, 28)),
                        hintText: 'Seu e-mail',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 60),
                child: InkWell(
                  onTap: () => _resetPassword(context),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 8, 46, 28),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Enviar Email para redefinição'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 190.0),
                child: Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPage()));
                    },
                    child: Text('Voltar ao Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue[700],
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

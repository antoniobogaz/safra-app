import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/forgotpassword.dart';
import 'package:flutter_safraapp/views/homePage.dart';
import 'package:flutter_safraapp/views/signinPage.dart';
import 'package:flutter_safraapp/servicos/autenticacao_servico.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String logo = 'images/Logo_SafraApp1.png';
  bool _obscureText = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  AutenticacaoServico _autenServico = AutenticacaoServico();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.5,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 89, 47),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    logo,
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 8, 46, 28), width: 2),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Color.fromARGB(255, 8, 46, 28),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.1,
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
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.person,
                                color: Color.fromARGB(255, 8, 46, 28)),
                            hintText: 'Usuário',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28))),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.1,
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
                            child: TextFormField(
                              controller: _senhaController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: 'Senha',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 8, 46, 28),
                                ),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 8, 46, 28),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color.fromARGB(255, 8, 46, 28)),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Padding(
                        padding: EdgeInsets.only(left: 200),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forgotpassword()));
                          },
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 80),
                child: InkWell(
                  onTap: () {
                    metodoLogin();
                  },
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
                        'Entrar'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        'Não tem uma conta?',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black, // Cor do texto
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 150),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signinPage()));
                        },
                        child: Text(
                          ' Cadastre-se',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color:
                                Color.fromARGB(255, 2, 89, 47), // Cor do texto
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  metodoLogin() {
    String email = _emailController.text;
    String senha = _emailController.text;

    _autenServico.logarUsuarios(senha: senha, email: email).then(
      (String? erro) {
        //Voltou com erro
        if (erro != null) {
          mostrarSnackBar(context: context, texto: erro);
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => homePage()));
        }
      },
    );
  }
}

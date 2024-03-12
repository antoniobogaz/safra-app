import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_safraapp/servicos/autenticacao_servico.dart';
import 'package:flutter_safraapp/views/loginPage.dart';
import 'package:flutter_safraapp/views/registrationScreenPF.dart';

class signinPage extends StatefulWidget {
  const signinPage({super.key});

  @override
  State<signinPage> createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> {
  String logo = 'images/Logo_SafraApp1.png';
  bool _obscureText = true;
  bool _obscureText2 = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  AutenticacaoServico _autenServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
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
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                  left: 10,
                ),
                child: Text(
                  'Vamos realizar seu cadastro, precisamos apenas de algumas informações:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 15),
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
                child: TextFormField(
                  controller: _nomeController,
                  validator: (String? value) {
                    if (value == null) {
                      return "O nome não pode ser vazio";
                    }
                    if (value.length < 2) {
                      return "O nome é muito curto";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.person,
                          color: Color.fromARGB(255, 8, 46, 28)),
                      hintText: 'Nome',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
                ),
              ),
            ),
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
                      color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
              child: TextFormField(
                controller: _emailController,
                validator: (String? value) {
                  if (value == null) {
                    return "O e-mail não pode ser vazio";
                  }
                  if (value.length < 5) {
                    return "O e-mail é muito curto";
                  }
                  if (!value.contains("@")) {
                    return "O e-mail não é valido";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.email,
                        color: Color.fromARGB(255, 8, 46, 28)),
                    hintText: 'E-mail',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 8, 46, 28))),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 15),
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
                            color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                    child: TextFormField(
                      controller: _senhaController,
                      validator: (String? value) {
                        if (value == null) {
                          return "A senha não pode ser vazia";
                        }
                        if (value.length < 5) {
                          return "A senha é muito curta";
                        }
                        return null;
                      },
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
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 15),
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
                            color: Color.fromARGB(255, 8, 46, 28), width: 2.0)),
                    child: TextFormField(
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                        hintText: 'Confirme a Senha',
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
                              _obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color.fromARGB(255, 8, 46, 28)),
                          onPressed: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
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
              padding: EdgeInsets.only(top: 40),
              child: InkWell(
                onTap: () {
                  metodoAutenticacao();
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => registrationScreenPF()));*/
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
                      'Cadastrar-se'.toUpperCase(),
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
                      'Já tem uma conta?',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginPage()));
                      },
                      child: Text(
                        ' Fazer Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Color.fromARGB(255, 2, 89, 47), // Cor do texto
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  metodoAutenticacao() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _emailController.text;

    _autenServico.cadastrarUsuario(nome: nome, senha: senha, email: email);
  }
}

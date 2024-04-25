import 'package:flutter/material.dart';
import 'package:flutter_safraapp/views/homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class editProfilePage extends StatefulWidget {
  const editProfilePage({super.key});

  @override
  State<editProfilePage> createState() => _editProfilePageState();
}

final firestore = FirebaseFirestore.instance;

@override
class _editProfilePageState extends State<editProfilePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/Logo_SafraApp3.png', // Substitua pelo caminho da sua imagem
                  height: 40, // Ajuste a altura conforme necessário
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 2, 89, 47),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Center(
                  child: Text(
                'Editar Perfil',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 89, 47),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.red,
                backgroundImage: const NetworkImage(
                  'https://images.pexels.com/photos/41008/cowboy-ronald-reagan-cowboy-hat-hat-41008.jpeg?auto=compress&cs=tinysrgb&w=400',
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color.fromARGB(255, 2, 89, 47),
                      width: 5.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Alterar foto',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Dados da Empresa',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Nome da Empresa',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'CNPJ',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Razão Social',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Nome Fantasia',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Responsável Legal',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Endereço da Empresa',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Rua',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Número',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.57,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Bairro',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Cidade',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Estado',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Dados Pessoais do Proprietário da Empresa',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Nome',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 8, 46, 28),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 8, 46, 28),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Sobrenome',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 8, 46, 28)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 8, 46, 28),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 8, 46, 28),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'CPF',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'RG',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Contato',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'CPF',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'RG',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 8, 46, 28),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 70, bottom: 40),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homePage()));
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
                      'salvar'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

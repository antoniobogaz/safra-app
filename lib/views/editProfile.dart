import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_safraapp/servicos/lista_de_valores.dart';

class editProfilePage extends StatefulWidget {
  const editProfilePage({super.key});

  @override
  State<editProfilePage> createState() => _editProfilePageState();
}

String? _selectedValue_estados;
String? _selectedValue_area;

final _nomeEmpresa = TextEditingController();
final _CNPJ = MaskedTextController(mask: '00.000.000/0000-00');
final _razaoSocial = TextEditingController();
final _nomeFantasia = TextEditingController();
final _logradouro = TextEditingController();
final _CEP = MaskedTextController(mask: '00000-000');
final _complemento = TextEditingController();
final _setor = TextEditingController();
final _cidade = TextEditingController();
final _nome = TextEditingController();
final _sobrenome = TextEditingController();
final _CPF = MaskedTextController(mask: '000.000.000-00');
final _RG = MaskedTextController(mask: '00.000.000-0');
final _email = TextEditingController();
final _celular = MaskedTextController(mask: '(00)00000-0000');

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
                  controller: _nomeEmpresa,
                  keyboardType: TextInputType.name,
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
                  controller: _CNPJ,
                  keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.name,
                  controller: _razaoSocial,
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
                  controller: _nomeFantasia,
                  keyboardType: TextInputType.name,
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
              padding: const EdgeInsets.only(top: 40.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Endereço da Propriedade',
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
                  controller: _logradouro,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      labelText: 'Logradouro',
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
                      controller: _CEP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'CEP',
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
                      controller: _complemento,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          labelText: 'Complemento',
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                child: DropdownButton(
                  value: _selectedValue_area,
                  isExpanded: true,
                  hint: const Text(
                    'Área',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items:
                      opcoes_area.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_area = newValue;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  controller: _cidade,
                  keyboardType: TextInputType.name,
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
                        color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                child: DropdownButton(
                  value: _selectedValue_estados,
                  isExpanded: true,
                  hint: const Text(
                    'Estado',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: opcoes_nivel_estados
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue_estados = newValue;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Dados Pessoais',
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
                        controller: _nome,
                        keyboardType: TextInputType.name,
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
                        controller: _sobrenome,
                        keyboardType: TextInputType.name,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                    height: 50,
                    child: TextField(
                      controller: _CPF,
                      keyboardType: TextInputType.number,
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
                      controller: _RG,
                      keyboardType: TextInputType.number,
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
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
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
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50,
                child: TextField(
                  controller: _celular,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Celular',
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
            Container(
              padding: EdgeInsets.only(top: 70, bottom: 40),
              child: InkWell(
                onTap: () => _aoSalvarUsuario(context),
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

  void _aoSalvarUsuario(BuildContext context) {
    var colecao = FirebaseFirestore.instance.collection('usuarios');
    var uid = FirebaseAuth.instance.currentUser!.uid;
    colecao
        .doc(uid)
        .set({
          'nomeEmpresa': _nomeEmpresa.text,
          'CNPJ': _CNPJ.text,
          'razaoSocial': _razaoSocial.text,
          'nomeFantasia': _nomeFantasia.text,
          'logradouro': _logradouro.text,
          'CEP': _CEP.text,
          'Complemento': _complemento.text,
          'setor': _selectedValue_area,
          'cidade': _cidade.text,
          'estado': _selectedValue_estados,
          'nomeUsuario': _nome.text,
          'sobrenome': _sobrenome.text,
          'CPF': _CPF.text,
          'RG': _RG.text,
          'email': _email.text,
          'celular': _celular.text,
          'uid': uid,
        })
        .then((value) => mostrarSnackBar(
            context: context, texto: "Dados Salvos com Sucesso", isErro: false))
        .catchError((error) => mostrarSnackBar(
            context: context,
            texto: "Algo deu errado. Tente Novamente. Erro: $error",
            isErro: true));
  }
}

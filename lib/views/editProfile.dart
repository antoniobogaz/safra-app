import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_safraapp/views/homePage.dart';
import 'package:flutter_safraapp/widgets/meu_snackbar.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_safraapp/servicos/lista_de_valores.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class editProfilePage extends StatefulWidget {
  //const editProfilePage({super.key});
  final String nomeEmpresa;
  final String cnpj;
  final String razaoSocial;
  final String nomeFantasia;
  final String logradouro;
  final String cep;
  final String complemento;
  final String cidade;
  final String nome;
  final String sobrenome;
  final String cpf;
  final String rg;
  final String email;
  final String celular;
  final String estado;
  final String setor;

  editProfilePage({
    Key? key,
    required this.nomeEmpresa,
    required this.cnpj,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.logradouro,
    required this.cep,
    required this.complemento,
    required this.cidade,
    required this.nome,
    required this.sobrenome,
    required this.cpf,
    required this.rg,
    required this.email,
    required this.celular,
    required this.estado,
    required this.setor,
  }) : super(key: key);

  @override
  State<editProfilePage> createState() => _editProfilePageState();
}

String? _selectedValue_estados;
String? _selectedValue_area;

@override
class _editProfilePageState extends State<editProfilePage> {
  File? _image;
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

  Future<File?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<String?> _uploadProfilePicture(File image) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      Reference storageReference = FirebaseStorage.instance.ref().child('profile_pictures/$uid.jpg');
      UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;

      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      print('Erro ao fazer upload da imagem: $e');
      return null;
    }
  }

  Future<void> _selectAndUploadImage() async {
    File? pickedImage = await _pickImage();
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });

      String? downloadUrl = await _uploadProfilePicture(pickedImage);
      if (downloadUrl != null) {
        setState(() {
          _downloadUrl = downloadUrl;
        });

        String uid = FirebaseAuth.instance.currentUser!.uid;

        DocumentReference userDocRef = FirebaseFirestore.instance.collection('usuarios').doc(uid);

        // Verifique se o documento do usuário existe
        DocumentSnapshot userDoc = await userDocRef.get();
        if (!userDoc.exists) {
          // Se o documento não existir, crie-o
          await userDocRef.set({
            'profilePicture': downloadUrl,
            // Adicione outros campos padrão, se necessário
          });
        } else {
          // Se o documento já existir, faça o update
          await userDocRef.update({
            'profilePicture': downloadUrl,
          });
        }
      }
    }
  }

  late TextEditingController nomeEmpresaController;
  late TextEditingController cnpjController;
  late TextEditingController razaoSocialController;
  late TextEditingController nomeFantasiaController;
  late TextEditingController logradouroController;
  late TextEditingController cepController;
  late TextEditingController complementoController;
  late TextEditingController cidadeController;
  late TextEditingController nomeController;
  late TextEditingController sobrenomeController;
  late TextEditingController cpfController;
  late TextEditingController rgController;
  late TextEditingController emailController;
  late TextEditingController celularController;

  @override
  void initState() {
    super.initState();
    _loadProfilePicture();
    nomeEmpresaController = TextEditingController(text: widget.nomeEmpresa);
    cnpjController = MaskedTextController(mask: '00.000.000/0000-00', text: widget.cnpj);
    razaoSocialController = TextEditingController(text: widget.razaoSocial);
    nomeFantasiaController = TextEditingController(text: widget.nomeFantasia);
    logradouroController = TextEditingController(text: widget.logradouro);
    cepController = MaskedTextController(mask: '00000-000', text: widget.cep);
    complementoController = TextEditingController(text: widget.complemento);
    cidadeController = TextEditingController(text: widget.cidade);
    nomeController = TextEditingController(text: widget.nome);
    sobrenomeController = TextEditingController(text: widget.sobrenome);
    cpfController = MaskedTextController(mask: '000.000.000-00', text: widget.cpf);
    rgController = MaskedTextController(mask: '00.000.000-0', text: widget.rg);
    emailController = TextEditingController(text: widget.email);
    celularController = MaskedTextController(mask: '(00)00000-0000', text: widget.celular);

    _selectedValue_estados = widget.estado.isEmpty ? null : widget.estado;
    _selectedValue_area = widget.setor.isEmpty ? null : widget.setor;
  }

  @override
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
                  'images/Logo_SafraApp3.png',
                  height: 40,
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
                style: TextStyle(color: Color.fromARGB(255, 2, 89, 47), fontSize: 24, fontWeight: FontWeight.bold),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: _downloadUrl != null ? NetworkImage(_downloadUrl!) : null,
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
                  child: _image == null && _downloadUrl == null ? Icon(Icons.person, size: 80, color: Colors.white) : null,
                ),
              ),
            ),
            TextButton(
              onPressed: _selectAndUploadImage,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Alterar foto',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
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
                  controller: nomeEmpresaController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Nome da Empresa',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                  controller: cnpjController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'CNPJ',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                  controller: razaoSocialController,
                  decoration: InputDecoration(
                      labelText: 'Razão Social',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                  controller: nomeFantasiaController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Nome Fantasia',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                  controller: logradouroController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      labelText: 'Logradouro',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                      controller: cepController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'CEP',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                      controller: complementoController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          labelText: 'Complemento',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                    border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                child: DropdownButton(
                  value: _selectedValue_area,
                  isExpanded: true,
                  hint: const Text(
                    'Área',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: opcoes_area.map<DropdownMenuItem<String>>((String value) {
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
                  controller: cidadeController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Cidade',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                    border: Border.all(color: Color.fromARGB(255, 8, 46, 28), width: 1.5)),
                child: DropdownButton(
                  value: _selectedValue_estados,
                  isExpanded: true,
                  hint: const Text(
                    'Estado',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 46, 28),
                    ),
                  ),
                  items: opcoes_nivel_estados.map<DropdownMenuItem<String>>((String value) {
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
                        controller: nomeController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Nome',
                            labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                        controller: sobrenomeController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Sobrenome',
                            labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                      controller: cpfController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'CPF',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                      controller: rgController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'RG',
                          labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                  controller: celularController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Celular',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 8, 46, 28)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 8, 46, 28), width: 1.5),
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
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

    Map<String, dynamic> dadosUsuario = {
      'nomeEmpresa': nomeEmpresaController.text.isEmpty ? null : nomeEmpresaController.text,
      'CNPJ': cnpjController.text.isEmpty ? null : cnpjController.text,
      'razaoSocial': razaoSocialController.text.isEmpty ? null : razaoSocialController.text,
      'nomeFantasia': nomeFantasiaController.text.isEmpty ? null : nomeFantasiaController.text,
      'logradouro': logradouroController.text.isEmpty ? null : logradouroController.text,
      'CEP': cepController.text.isEmpty ? null : cepController.text,
      'Complemento': complementoController.text.isEmpty ? null : complementoController.text,
      'setor': _selectedValue_area?.isEmpty ?? true ? null : _selectedValue_area,
      'cidade': cidadeController.text.isEmpty ? null : cidadeController.text,
      'estado': _selectedValue_estados?.isEmpty ?? true ? null : _selectedValue_estados,
      'nomeUsuario': nomeController.text.isEmpty ? null : nomeController.text,
      'sobrenome': sobrenomeController.text.isEmpty ? null : sobrenomeController.text,
      'CPF': cpfController.text.isEmpty ? null : cpfController.text,
      'RG': rgController.text.isEmpty ? null : rgController.text,
      'email': emailController.text.isEmpty ? null : emailController.text,
      'celular': celularController.text.isEmpty ? null : celularController.text,
      'uid': uid,
      'profilePicture': _downloadUrl?.isEmpty ?? true ? null : _downloadUrl,
    };

    colecao.doc(uid).set(dadosUsuario).then(
      (value) {
        mostrarSnackBar(context: context, texto: "Dados Salvos com Sucesso", isErro: false);
        Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
      },
    ).catchError((error) => mostrarSnackBar(context: context, texto: "Algo deu errado. Tente Novamente. Erro: $error", isErro: true));
  }
}

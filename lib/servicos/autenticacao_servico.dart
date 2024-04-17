import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AutenticacaoServico {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String?> cadastrarUsuario({
    required String nome,
    required String senha,
    required String email,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      await userCredential.user!.updateDisplayName(nome);

      return null;
    } on FirebaseAuthException catch (e) {
      return _mensagemErro(e.code);
    }
  }

  Future<String?> logarUsuarios(
      {required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      //print(e.code);
      return _mensagemErro(e.code);
    }
  }

  Future<String?> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return null;
    } on FirebaseAuthException catch (e) {
      return _mensagemErro(e.code);
    }
  }

  String _mensagemErro(String errorCode) {
    switch (errorCode) {
      case 'invalid-credential':
        return 'Usuário ou Senha inválidos';
      case 'channel-error':
        return 'Informe Usuário e Senha para continuar';
      case 'invalid-email':
        return 'O formato do email é inválido.';
      case 'user-disabled':
        return 'Este usuário foi desabilitado.';
      case 'user-not-found':
        return 'Usuário não encontrado.';
      case 'wrong-password':
        return 'Senha incorreta.';
      case 'email-already-in-use':
        return 'O email já está sendo utilizado em outra conta.';
      case 'operation-not-allowed':
        return 'Login com email e senha não está habilitado.';
      case 'weak-password':
        return 'A senha é muito fraca.';
      default:
        return 'Ocorreu um erro desconhecido. Por favor, tente novamente.';
    }
  }
}

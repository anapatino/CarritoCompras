import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ControlerAuthF extends GetxController {
  final FirebaseAuth authF = FirebaseAuth.instance;
  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _usuarior = "Sin Registro".obs;

  String get emailF => _uid.value;
  String get uid => _usuarior.value;

  Future<void> registrarEmail(String email, String password) async {
    try {
      UserCredential usuario = await authF.createUserWithEmailAndPassword(
          email: email, password: password);
      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
      if (kDebugMode) {
        print(usuario);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('the password provided is too weak.');
      } else if (e.code == 'email-alredy-in-use') {
        return Future.error('the account already exists for that email.');
      }
    }
  }
}

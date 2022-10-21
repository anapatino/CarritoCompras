import 'package:example/data/services/peticionesUser.dart';
import 'package:get/get.dart';
import '../models/user.dart';

class ControlUser extends GetxController {
  final Rxn<List<User>> _users = Rxn<List<User>>();

  List<User>? get user => _users.value;

  Future<void> enviarDatos(String usuario, String password) async {
    _users.value = await PeticionesUser.validarUser(usuario, password);
  }
}

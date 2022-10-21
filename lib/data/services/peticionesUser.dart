import 'dart:convert';
import 'package:example/domain/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionesUser {
  static Future<List<User>> validarUser(String user, String passwd) async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APIMOVIL/listaruser.php");
    final response = await http.post(url, body: {'user': user, 'pass': passwd});
    return compute(convertir, response.body);
  }

  static List<User> convertir(String respuestaBody) {
    final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}

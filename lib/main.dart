import 'package:example/domain/controller/controlUserF.dart';
import 'package:example/domain/controller/controllerCarrito.dart';
import 'package:example/domain/controller/controlUser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/app.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ControlCompras());
  Get.put(ControlUser());
  Get.put(ControlerAuthF());
  runApp(const App());
}

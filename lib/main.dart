import 'package:example/domain/controller/controllerCarrito.dart';
import 'package:example/domain/controller/controlUser.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/app.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ControlCompras());
  Get.put(ControlUser());
  runApp(const App());
}

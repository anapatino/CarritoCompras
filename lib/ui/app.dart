import 'package:example/ui/pages/carrito.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/auth/login.dart';
import 'package:example/ui/pages/productos.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Carrito de compras',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const Login(),
        '/productos': (context) => const Productos(),
        '/carrito': (context) => const Carrito(),
      },
      home: const Login(),
    );
  }
}

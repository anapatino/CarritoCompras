import 'package:example/domain/controller/controllerCarrito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Carrito extends StatelessWidget {
  const Carrito({super.key});

  @override
  Widget build(BuildContext context) {
    ControlCompras controlC = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de compras')),
      body: Column(
        children: [
          const Text('Factura de compras'),
          Text('Mouse opticos ${controlC.cantidad}')
        ],
      ),
    );
  }
}

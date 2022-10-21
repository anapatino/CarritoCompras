import 'package:example/domain/controller/controllerCarrito.dart';
import 'package:example/ui/pages/carrito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productos extends StatelessWidget {
  const Productos({super.key});

  @override
  Widget build(BuildContext context) {
    ControlCompras controlC = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('Listado de productos'), actions: [
        IconButton(
            onPressed: () {
              Get.to(() => const Carrito());
            },
            icon: const Icon(Icons.shopping_cart)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.exit_to_app_outlined)),
      ]),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  controlC.removeArticulo();
                },
                icon: const Icon(Icons.remove_circle)),
            const Text('mouse optico'),
            IconButton(
                onPressed: () {
                  controlC.addArticulo();
                },
                icon: const Icon(Icons.add_circle)),
            Obx(() => Text('${controlC.cantidad}'))
          ],
        )
      ]),
    );
  }
}

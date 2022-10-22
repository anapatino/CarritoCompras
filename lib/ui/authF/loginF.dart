import 'package:example/domain/controller/controlUser.dart';
import 'package:example/domain/controller/controlUserF.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginF extends StatefulWidget {
  const LoginF({super.key});

  @override
  State<LoginF> createState() => _LoginFState();
}

class _LoginFState extends State<LoginF> {
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  ControlerAuthF controlU = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://www.elheraldo.co/sites/default/files/articusslo/2021/01/04/471_anos_de_valledupar.jpg"),
              ),
              TextField(
                controller: controlUser,
                decoration: const InputDecoration(
                  labelText: 'Ingrese Usuario',
                ),
              ),
              TextField(
                controller: controlPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Ingrese la contraseña',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.login)),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        controlU
                            .registrarEmail(
                                controlUser.text, controlPassword.text)
                            .then((value) {
                          if (controlU.emailF != 'Sin Registro') {
                            Get.offAllNamed('/productos');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'validacion de usuarios',
                              message: 'datos invalidos',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.red,
                            ));
                          }
                        });
                      },
                      icon: const Icon(Icons.app_registration_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

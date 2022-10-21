import 'package:example/domain/controller/controlUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controlUser = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  ControlUser controlU = Get.find();
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
                    "https://www.kindpng.com/picc/m/78-785827_user-profile-avatar-login-account-male-user-icon.png"),
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
                  IconButton(
                      onPressed: () {
                        controlU.update();
                        controlU
                            .enviarDatos(controlUser.text, controlPassword.text)
                            .then((value) {
                          if (controlU.user!.isNotEmpty == true) {
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
                      icon: const Icon(Icons.login)),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {},
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

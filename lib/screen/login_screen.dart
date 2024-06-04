import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screen/eligerol_screen.dart';
import 'package:myapp/screen/home_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const name = 'LoginScreen';
  LoginScreen({super.key});

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  List<String> users = ['Aiden', 'Ale', 'Marcos'];
  List<String> passwords = ['123', 'soyAle', 'miContraseña123'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MediFest',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: userController,
            decoration: const InputDecoration(
                hintText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: passController,
            decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
            obscureText: true,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                SnackBar errorMessage = const SnackBar(
                    content: Text('Usuario o contraseña incorrectos'));
                String inputUser = userController.text;
                String inputPass = passController.text;

                if (users.contains(inputUser) &&
                    passwords.contains(inputPass)) {
                  context.pushNamed(HomeScreen.name,
                      extra: userController.text);
                } else if (inputUser.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(errorMessage);
                } else if (inputPass.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(errorMessage);
                } else if (users.contains(inputUser) == false ||
                    passwords.contains(inputPass) == false) {
                  ScaffoldMessenger.of(context).showSnackBar(errorMessage);
                }
              },
              child: const Text(
                'Login',
              )),
         const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Todavía no tienes cuenta?'),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(EligeRol.name);
                  },
                  child: const Text(
                    'Crear cuenta',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
              
        ],
      ),
    ));
  }
}

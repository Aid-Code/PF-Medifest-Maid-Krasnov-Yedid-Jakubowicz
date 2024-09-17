import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screen/eligerol_screen.dart';
import 'package:myapp/screen/home_screen.dart';

// Modelo para el usuario
class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  static const name = 'LoginScreen';
  LoginScreen({super.key});

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // Lista de usuarios usando la clase User
  List<User> users = [
    User(username: 'Aiden', password: '123'),
    User(username: 'Ale', password: 'soyAle'),
    User(username: 'Marcos', password: 'miContraseña123')
  ];

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

                bool userFound = users.any((user) =>
                    user.username == inputUser && user.password == inputPass);

                if (userFound) {
                  context.pushNamed(HomeScreen.name, extra: inputUser);
                } else if (inputUser.isEmpty || inputPass.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(errorMessage);
                } else {
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

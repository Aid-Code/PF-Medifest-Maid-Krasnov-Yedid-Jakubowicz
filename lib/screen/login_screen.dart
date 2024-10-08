import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/user.dart';
import 'package:myapp/screen/home_screen.dart';
import 'package:myapp/entities/globals.dart'; // Importa la lista global de usuarios

class LoginScreen extends StatefulWidget {
  static const name = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Función para validar el inicio de sesión
  void _loginUser() {
    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    // Buscar si el usuario existe y tiene la contraseña correcta
    User? foundUser;
    try {
      foundUser = registeredUsers.firstWhere(
        (user) => user.username == enteredUsername && user.password == enteredPassword,
      );
    } catch (e) {
      foundUser = null; // Usuario no encontrado
    }

    if (foundUser != null) {
      // Login exitoso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('¡Bienvenido, ${foundUser.firstName}!')),
      );
      // Redirigir a la pantalla de inicio
      context.goNamed(HomeScreen.name);
    } else {
      // Mostrar error si las credenciales no son correctas
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nombre de usuario o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Iniciar sesión',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginUser,
              child: const Text('Iniciar sesión'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de registro si no tiene una cuenta
                context.goNamed('RegisterScreen');
              },
              child: const Text('¿No tienes una cuenta? Regístrate aquí'),
            ),
          ],
        ),
      ),
    );
  }
}

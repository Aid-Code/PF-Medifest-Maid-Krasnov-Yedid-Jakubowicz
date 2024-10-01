import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/user.dart';
import 'package:myapp/screen/home_screen.dart'; // Asegúrate de que la clase User esté correctamente importada

class LoginScreen extends StatefulWidget {
  static const name = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Simulamos una lista de usuarios registrados para validar el login
  final List<User> registeredUsers = [
    User(
      username: 'usuario1',
      password: 'contraseña1',
      firstName: 'Juan',
      lastName: 'Pérez',
      email: 'juan@example.com',
      phone: '+34123456789',
      gender: 'Masculino',
      birthDate: DateTime(1990, 5, 23),
    ),
    // Otros usuarios de ejemplo...
  ];

  // Función para validar el login
  void _loginUser() {
    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    // Modificación: se usa firstWhere con orElse para manejar el caso de usuario no encontrado
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
      // Redirigir a otra pantalla (Formulario o Home Screen)
      context.goNamed(HomeScreen.name); // Asegúrate de tener esta ruta configurada en GoRouter
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
                context.goNamed('RegisterScreen'); // Asegúrate de tener esta ruta configurada en GoRouter
              },
              child: const Text('¿No tienes una cuenta? Regístrate aquí'),
            ),
          ],
        ),
      ),
    );
  }
}

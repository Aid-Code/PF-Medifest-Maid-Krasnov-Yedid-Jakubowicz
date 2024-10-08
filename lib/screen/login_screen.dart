import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/screen/eligerol_screen.dart';
import 'package:myapp/screen/home_screen.dart';
import 'package:myapp/screen/registro_screen.dart';

class LoginScreen extends StatefulWidget {
  static const name = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Función para validar el inicio de sesión
  Future<void> _loginUser() async {
    String enteredEmail = emailController.text; // Cambié el nombre de la variable
    String enteredPassword = passwordController.text;

    try {
      // Intenta iniciar sesión con Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: enteredEmail,
        password: enteredPassword,
      );

      // Recuperar información adicional del usuario de Firestore
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;

      if (userData != null) {
        // Si el inicio de sesión es exitoso y se recuperan los datos, redirigir a la pantalla de inicio
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('¡Bienvenido, ${userData['firstName']}!')),
        );

        // Pasar el usuario a la pantalla de inicio
        context.goNamed(HomeScreen.name, extra: userCredential.user);
      } else {
        throw Exception('No se encontraron datos del usuario');
      }
    } catch (e) {
      // Mostrar error si las credenciales no son correctas o si hay otro error
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
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario (correo electrónico)',
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
                context.goNamed(EligeRol.name);
              },
              child: const Text('¿No tienes una cuenta? Regístrate aquí'),
            ),
          ],
        ),
      ),
    );
  }
}

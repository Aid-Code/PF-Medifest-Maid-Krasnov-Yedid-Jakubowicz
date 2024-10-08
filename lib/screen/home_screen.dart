import 'package:flutter/material.dart';
import 'package:myapp/entities/user.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  static const name = 'HomeScreen';

  final User? user; // Recibe un objeto User

  HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text(
          '¡Welcome ${user!.username}!', // Usa el atributo username de User
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

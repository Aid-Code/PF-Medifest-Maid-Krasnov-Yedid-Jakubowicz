import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/entities/user.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'HomeScreen';
  final AppUser user; // Usuario autenticado de Firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  HomeScreen({required this.user});

  Future<Map<String, dynamic>?> getUserData() async {
    DocumentSnapshot userData = await _firestore.collection('users').doc(user.uid).get();
    return userData.data() as Map<String, dynamic>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: getUserData(),
        builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos'));
          }
          if (snapshot.data == null) {
            return const Center(child: Text('No se encontraron datos'));
          }

          final userData = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('¡Bienvenido, ${userData['firstName']} ${userData['lastName']}!'),
                Text('Correo: ${userData['email']}'),
                Text('Teléfono: ${userData['phone']}'),
                Text('Género: ${userData['gender']}'),
                Text('Fecha de nacimiento: ${userData['birthDate']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

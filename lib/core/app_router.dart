import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/entities/user.dart'; // Cambia esto a tu clase renombrada
import 'package:myapp/screen/eligerol_screen.dart';
import 'package:myapp/screen/formulariousuario_screen.dart';
import 'package:myapp/screen/home_screen.dart';
import 'package:myapp/screen/login_screen.dart';
import 'package:myapp/screen/registro_screen.dart';
import 'package:myapp/screen/registrodoctor_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: LoginScreen.name,
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: HomeScreen.name,
      path: '/home',
      builder: (context, state) {
        return FutureBuilder<User?>(
          future: _getCurrentUser(), // Función para obtener el usuario actual
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra un loader mientras espera
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData && snapshot.data != null) {
              final firebaseUser = snapshot.data!;
              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users') // Cambia esto al nombre de tu colección
                    .doc(firebaseUser.uid)
                    .get(),
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    // Muestra un loader mientras espera
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (userSnapshot.hasData && userSnapshot.data != null) {
                    final userDoc = userSnapshot.data!;
                    final user = AppUser(
                      uid: firebaseUser.uid,
                      username: userDoc['username'],
                      password: userDoc['password'], // Considera cómo manejas esto por seguridad
                      firstName: userDoc['firstName'],
                      lastName: userDoc['lastName'],
                      email: userDoc['email'],
                      phone: userDoc['phone'],
                      gender: userDoc['gender'],
                      birthDate: (userDoc['birthDate'] as Timestamp).toDate(),
                    );

                    return HomeScreen(user: user); // Pasar la instancia de AppUser
                  } else {
                    // Manejar el caso de que no se encontró el documento del usuario
                    return const Center(child: Text('Error: No se encontró el usuario.'));
                  }
                },
              );
            } else {
              // Manejar el caso de que no hay usuario autenticado
              return LoginScreen(); // Redirigir al login si no hay usuario autenticado
            }
          },
        );
      },
    ),
    GoRoute(
      name: EligeRol.name,
      path: '/eligerol',
      builder: (context, state) => EligeRol(),
    ),
    GoRoute(
      name: RegisterScreen.name,
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      name: FormularioScreen.name,
      path: '/formulariousuario',
      builder: (context, state) => FormularioScreen(),
    ),
    GoRoute(
      name: RegisterDocScreen.name,
      path: '/registerDoc',
      builder: (context, state) => RegisterDocScreen(),
    ),
  ],
);

// Función para obtener el usuario actual
Future<User?> _getCurrentUser() async {
  return FirebaseAuth.instance.currentUser;
}

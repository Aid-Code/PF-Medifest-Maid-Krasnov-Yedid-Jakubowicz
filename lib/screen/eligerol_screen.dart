import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screen/registro_screen.dart';
import 'package:myapp/screen/registrodoctor_screen.dart';

class EligeRol extends StatelessWidget {
  static const name = 'EligeRol';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elige Rol'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¿Qué rol vas a cumplir en la aplicación?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    context.goNamed(RegisterScreen.name);
                  },
                  child: const Text(
                    'Usuario',
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    context.goNamed(RegisterDocScreen.name);
                  },
                  child: const Text(
                    'Doctor',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
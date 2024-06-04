import 'package:flutter/material.dart';

class FormularioScreen extends StatefulWidget {
  static const name = 'FormularioScreen';

  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  String? selectedEnfermedad;
  String? selectedTipoSangre;

  TextEditingController sintomasController = TextEditingController();
  TextEditingController tratamientoController = TextEditingController();
  TextEditingController medicacionController = TextEditingController();

  final List<String> enfermedades = ['Enfermedad 1', 'Enfermedad 2', 'Enfermedad 3'];
  final List<String> tiposSangre = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Salud'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: selectedEnfermedad,
              items: enfermedades.map((String enfermedad) {
                return DropdownMenuItem<String>(
                  value: enfermedad,
                  child: Text(enfermedad),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedEnfermedad = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enfermedad que padece',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: sintomasController,
              decoration: const InputDecoration(
                labelText: 'Síntomas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedTipoSangre,
              items: tiposSangre.map((String tipo) {
                return DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedTipoSangre = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Tipo de sangre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: tratamientoController,
              decoration: const InputDecoration(
                labelText: '¿Cómo lo tratas?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: medicacionController,
              decoration: const InputDecoration(
                labelText: '¿Qué medicación utilizas?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para manejar el envío del formulario
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
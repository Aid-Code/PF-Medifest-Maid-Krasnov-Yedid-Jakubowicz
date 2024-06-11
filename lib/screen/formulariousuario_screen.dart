import 'package:flutter/material.dart';

class FormularioScreen extends StatefulWidget {
  static const name = 'FormularioScreen';

  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  // Controladores para los campos de texto
  TextEditingController sintomasController = TextEditingController();
  TextEditingController tratamientoController = TextEditingController();
  TextEditingController medicacionController = TextEditingController();
  
  // Lista de enfermedades comunes
  final List<String> enfermedades = [
    'Diabetes', 'Hipertensión', 'Cáncer', 'Enfermedad de corazón', 'Asma', 
    'Alergias', 'Artritis', 'Enfermedad renal', 'Migrañas', 'Enfermedad pulmonar',
    'Osteoporosis', 'Depresión', 'Enfermedad de la tiroides', 'Gastritis', 'Enfermedad hepática',
    'VIH/SIDA', 'Alzheimer', 'Parkinson', 'Anemia', 'Epilepsia', 'Otro'
  ];

  // Lista de tipos de sangre
  final List<String> tiposSangre = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  // Lista para almacenar enfermedades seleccionadas y su campo adicional
  List<Map<String, dynamic>> enfermedadesSeleccionadas = [];

  // Función para agregar una nueva enfermedad
  void _addEnfermedad() {
    setState(() {
      enfermedadesSeleccionadas.add({'enfermedad': null, 'controladorOtro': TextEditingController()});
    });
  }

  @override
  void initState() {
    super.initState();
    // Añadir la primera enfermedad por defecto
    _addEnfermedad();
  }

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
            ...enfermedadesSeleccionadas.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> enfermedadData = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField<String>(
                    value: enfermedadData['enfermedad'],
                    items: enfermedades.map((String enfermedad) {
                      return DropdownMenuItem<String>(
                        value: enfermedad,
                        child: Text(enfermedad),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        enfermedadesSeleccionadas[index]['enfermedad'] = newValue;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enfermedad que padece',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (enfermedadData['enfermedad'] == 'Otro')
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextField(
                        controller: enfermedadData['controladorOtro'],
                        decoration: const InputDecoration(
                          labelText: 'Especifique otra enfermedad',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
            GestureDetector(
              onTap: _addEnfermedad,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, color: Colors.blue),
                  const SizedBox(width: 4),
                  const Text('Agregar otra enfermedad', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: sintomasController,
              decoration: const InputDecoration(
                labelText: 'Síntomas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: null,
              items: tiposSangre.map((String tipo) {
                return DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
              onChanged: (String? newValue) {},
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

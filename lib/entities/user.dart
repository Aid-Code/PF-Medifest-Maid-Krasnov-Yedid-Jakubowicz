class User {
  final String username; // Requerido
  final String password; // Requerido
  final String firstName; // Requerido
  final String lastName; // Requerido
  final String email; // Requerido
  final String phone; // Requerido
  final String gender; // Requerido
  final DateTime birthDate; // Requerido

  User({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthDate,
  });
}

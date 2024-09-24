class User {
  final String username; // Requerido
  final String password; // Requerido
  final String? firstName; // Opcional
  final String? lastName; // Opcional
  final String? email; // Opcional
  final String? phone; // Opcional
  final String? gender; // Opcional
  final DateTime? birthDate; // Opcional

  User({
    required this.username,
    required this.password,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.gender,
    this.birthDate,
  });
}

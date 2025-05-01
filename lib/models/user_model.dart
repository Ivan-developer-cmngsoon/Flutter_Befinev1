/// Modelo de usuario utilizado en la app Befine.
/// Incluye datos básicos como email, contraseña y rol (cliente, admin, dueño).
class User {
  final String name;
  final String email;
  final String password;
  final String role; // 'cliente', 'admin', 'dueno'

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
}

/// Lista de usuarios simulados para pruebas locales.
/// Esto reemplazará temporalmente a Firebase mientras construimos la lógica.
final List<User> mockUsers = [
  User(
    name: 'Carlos Cliente',
    email: 'cliente@befine.cl',
    password: 'cliente123',
    role: 'cliente',
  ),
  User(
    name: 'Ana Admin',
    email: 'admin@befine.cl',
    password: 'admin123',
    role: 'admin',
  ),
  User(
    name: 'Iván Dueño',
    email: 'dueno@befine.cl',
    password: 'dueno123',
    role: 'dueno',
  ),
];

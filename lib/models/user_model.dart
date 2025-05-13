import 'package:hive/hive.dart';

part 'user_model.g.dart'; // Este archivo se generará automáticamente

/// Modelo de usuario utilizado en la app Befine.
/// Incluye datos básicos como email, contraseña y rol (cliente, admin, dueño).
@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String role; // 'cliente', 'admin', 'dueno'

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
}
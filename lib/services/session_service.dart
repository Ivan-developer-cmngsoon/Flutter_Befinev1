import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:befine_app/models/user_model.dart';
import 'package:befine_app/screens/auth/login_screen.dart';
import 'package:befine_app/services/hive_user_service.dart'; // ✅ nuevo servicio

/// Servicio centralizado para la gestión de sesión del usuario.
/// Permite iniciar sesión, recuperar sesión y cerrar sesión de forma segura.
class SessionService {
  static User? _currentUser;

  /// Guarda el usuario actual en memoria y almacenamiento local.
  static Future<void> login(User user) async {
    _currentUser = user;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', user.email);
    await prefs.setString('role', user.role);
    await prefs.setString('name', user.name);
  }

  /// Elimina la sesión local del usuario (memoria + almacenamiento).
  static Future<void> logout() async {
    _currentUser = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('role');
    await prefs.remove('name');
  }

  /// Cierra sesión y redirige al login eliminando el historial de navegación.
  static Future<void> logoutAndRedirect(BuildContext context) async {
    await logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  /// Obtiene el usuario actual cargado en memoria.
  static User? get currentUser => _currentUser;

  /// Retorna `true` si hay un usuario activo cargado.
  static bool get isLoggedIn => _currentUser != null;

  /// Carga la sesión desde almacenamiento local al iniciar la app.
  static Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final role = prefs.getString('role');

    if (email != null && role != null) {
      final user = HiveUserService.getUserByEmail(email);
      if (user != null && user.role == role) {
        _currentUser = user;
      }
    }
  }
}

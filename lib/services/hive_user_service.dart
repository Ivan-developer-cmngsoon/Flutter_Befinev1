import 'package:hive/hive.dart';
import 'package:befine_app/models/user_model.dart';

class HiveUserService {
  static final Box<User> _userBox = Hive.box<User>('usersBox');

  /// Retorna todos los usuarios registrados
  static List<User> getAllUsers() {
    return _userBox.values.toList();
  }

  /// Busca un usuario por correo electrónico
  static User? getUserByEmail(String email) {
    try {
      return _userBox.values.firstWhere((u) => u.email == email);
    } catch (_) {
      return null;
    }
  }

  /// Valida login: busca usuario por correo y compara contraseña
  static User? login(String email, String password) {
    try {
      return _userBox.values.firstWhere(
        (u) => u.email == email && u.password == password,
      );
    } catch (_) {
      return null;
    }
  }

  /// Agrega un nuevo usuario si no existe el correo
  static Future<bool> addUser(User newUser) async {
    final exists = _userBox.values.any((u) => u.email == newUser.email);
    if (exists) return false;

    await _userBox.add(newUser);
    return true;
  }

  /// Elimina un usuario por email (opcional para panel del dueño)
  static Future<void> deleteUser(String email) async {
    final key = _userBox.keys.firstWhere(
      (k) => _userBox.get(k)?.email == email,
      orElse: () => null,
    );

    if (key != null) {
      await _userBox.delete(key);
    }
  }

  /// Limpia todos los usuarios (opcional para pruebas)
  static Future<void> clearAll() async {
    await _userBox.clear();
  }
    /// Actualiza los datos de un usuario existente por email
  static Future<bool> updateUser(User updatedUser) async {
    final key = _userBox.keys.firstWhere(
      (k) => _userBox.get(k)?.email == updatedUser.email,
      orElse: () => null,
    );

    if (key != null) {
      await _userBox.put(key, updatedUser);
      return true;
    }
    return false; // No se encontró el usuario
  }

}

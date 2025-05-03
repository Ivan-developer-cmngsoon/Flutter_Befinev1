import 'package:shared_preferences/shared_preferences.dart';
import 'package:befine_app/models/user_model.dart';

class SessionService {
  static User? _currentUser;

  static Future<void> login(User user) async {
    _currentUser = user;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', user.email);
    await prefs.setString('role', user.role);
    await prefs.setString('name', user.name);
  }

  static Future<void> logout() async {
    _currentUser = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('role');
    await prefs.remove('name');
  }

  static User? get currentUser => _currentUser;

  static bool get isLoggedIn => _currentUser != null;

  /// Carga la sesión desde almacenamiento local
  static Future<void> loadSession(List<User> mockUsers) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final role = prefs.getString('role');
    final name = prefs.getString('name');

    if (email != null && role != null && name != null) {
      // Busca el usuario en la lista simulada
      final user = mockUsers.firstWhere(
        (u) => u.email == email && u.role == role,
        orElse: () => User(name: name, email: email, password: '', role: role),
      );

      _currentUser = user;
    }
  }
}

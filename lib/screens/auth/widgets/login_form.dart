import 'package:flutter/material.dart';
import 'package:befine_app/models/user_model.dart';
import 'package:befine_app/services/session_service.dart';

// Pantallas según el rol del usuario
import 'package:befine_app/screens/cliente/cliente_home_screen.dart';
import 'package:befine_app/screens/admin/admin_dashboard.dart';
import 'package:befine_app/screens/dueno/dueno_panel.dart';

/// Formulario de inicio de sesión de la app Befine.
/// Autentica usuarios simulados, guarda sesión y redirige según su rol.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  /// Acción al presionar "Ingresar"
  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      User? user;

      try {
        user = mockUsers.firstWhere(
          (u) => u.email == _email && u.password == _password,
        );
      } catch (e) {
        user = null;
      }


      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Correo o contraseña incorrectos'),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      await SessionService.login(user);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bienvenido ${user.name}')),
      );

      // Redirige a la pantalla según el rol
      Widget destino;
      switch (user.role.toLowerCase()) {
        case 'cliente':
          destino = const ClienteHomeScreen();
          break;
        case 'admin':
          destino = const AdminDashboard();
          break;
        case 'dueno':
          destino = const DuenoPanel();
          break;
        default:
          destino = const ClienteHomeScreen(); // Rol no reconocido
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => destino),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 24),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Correo electrónico'),
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => _email = value!.trim(),
            validator: (value) =>
                value == null || !value.contains('@') ? 'Correo inválido' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
            onSaved: (value) => _password = value!.trim(),
            validator: (value) =>
                value == null || value.length < 6 ? 'Mínimo 6 caracteres' : null,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Ingresar'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:befine_app/models/user_model.dart'; // Modelo y base simulada
import 'package:befine_app/services/session_service.dart';

// Pantallas principales por rol
import 'package:befine_app/screens/cliente/cliente_home_screen.dart'; // Cliente
import 'package:befine_app/screens/admin/admin_dashboard.dart';       // Admin
import 'package:befine_app/screens/dueno/dueno_panel.dart';           // Dueño

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  /// Valida las credenciales contra la base simulada
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Busca un usuario que coincida con email y contraseña
      final User? user = mockUsers.where(
          (u) => u.email == _email && u.password == _password,
      ).isNotEmpty
          ? mockUsers.firstWhere((u) => u.email == _email && u.password == _password)
          : null;




      if (user == null) {
        // Usuario no encontrado
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Correo o contraseña incorrectos'),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      // Usuario válido → navegación según su rol
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bienvenido ${user.name}')),
      );

      //Guarda el usuario activo
      SessionService.login(user);

      Widget destination;

      switch (user.role) {
        case 'cliente':
          destination = const ClienteHomeScreen();
          break;
        case 'admin':
          destination = const AdminDashboard();
          break;
        case 'dueno':
          destination = const DuenoPanel();
          break;
        default:
          destination = const ClienteHomeScreen(); // Fallback
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => destination),
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

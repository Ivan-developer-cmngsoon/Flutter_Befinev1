import 'package:flutter/material.dart';
import 'package:befine_app/models/user_model.dart';
import 'package:befine_app/services/session_service.dart';

// Pantallas a mostrar según rol
import 'package:befine_app/screens/cliente/cliente_home_screen.dart';
import 'package:befine_app/screens/admin/admin_dashboard.dart';
import 'package:befine_app/screens/dueno/dueno_panel.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  /// Método que se ejecuta al presionar "Ingresar"
  /// Valida el formulario, busca el usuario en la lista mock y guarda sesión
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Busca si existe el usuario en la lista simulada
      final User? user = mockUsers.where(
        (u) => u.email == _email && u.password == _password,
      ).isNotEmpty
          ? mockUsers.firstWhere(
              (u) => u.email == _email && u.password == _password)
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

      // Usuario válido → guardar sesión en memoria y en disco
      await SessionService.login(user);

      // Mensaje de bienvenida
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bienvenido ${user.name}')),
      );

      // Redirección según rol
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
          destination = const ClienteHomeScreen(); // Por defecto
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

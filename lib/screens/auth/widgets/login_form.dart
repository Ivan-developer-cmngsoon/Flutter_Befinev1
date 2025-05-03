import 'package:flutter/material.dart';
import 'package:befine_app/models/user_model.dart';
import 'package:befine_app/services/session_service.dart';
import 'package:befine_app/screens/home/home_screen.dart'; // ← Nueva pantalla principal post-login

/// Widget que contiene el formulario de inicio de sesión para la app Befine.
/// Valida campos, busca al usuario simulado y redirige a HomeScreen().
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  /// Método ejecutado al presionar "Ingresar"
  /// Valida formulario, simula autenticación, guarda sesión y redirige.
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Busca si existe el usuario en la lista simulada (mock)
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

      // Usuario válido → guardar sesión en memoria y local
      await SessionService.login(user);

      // Mensaje de bienvenida
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bienvenido ${user.name}')),
      );

      // Redirigir a la pantalla principal general (HomeScreen detecta el rol)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
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

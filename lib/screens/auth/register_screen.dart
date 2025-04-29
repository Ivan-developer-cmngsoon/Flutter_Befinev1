import 'package:flutter/material.dart';
import 'widgets/register_form.dart';

/// Pantalla principal de registro de nuevos usuarios.
///
/// Esta pantalla muestra un título y el formulario importado desde `register_form.dart`.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrarse'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: RegisterForm(), // Importa el formulario desde el widget separado
      ),
    );
  }
}

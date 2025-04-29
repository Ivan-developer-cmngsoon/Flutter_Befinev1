import 'package:flutter/material.dart';

/// Widget de formulario para que un usuario inicie sesión.
///
/// Actualmente simula la autenticación de manera local, sin conexión a servicios reales.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  /// Acción al presionar el botón "Ingresar"
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Aquí se agregará Firebase Authentication en futuras etapas

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Inicio de sesión simulado')),
      );

      // Aquí podrías redirigir al dashboard según el rol
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
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

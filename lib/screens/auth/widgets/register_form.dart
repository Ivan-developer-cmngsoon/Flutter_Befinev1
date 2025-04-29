import 'package:flutter/material.dart';

/// Widget de formulario para registrar un nuevo usuario.
/// Por ahora, simula un registro local sin conexión a Firebase.
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  // Campos simulados para registrar un nuevo usuario
  String _name = '';
  String _email = '';
  String _password = '';

  /// Método que se ejecuta al presionar el botón "Registrar"
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Aquí en el futuro se conectará Firebase u otro backend

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registro simulado exitoso para $_name'),
        ),
      );

      // Puedes redirigir al login o a la pantalla principal luego del registro
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
            decoration: const InputDecoration(labelText: 'Nombre completo'),
            onSaved: (value) => _name = value!.trim(),
            validator: (value) =>
                value == null || value.isEmpty ? 'Ingresa tu nombre' : null,
          ),
          const SizedBox(height: 16),
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
            child: const Text('Registrar'),
          ),
        ],
      ),
    );
  }
}

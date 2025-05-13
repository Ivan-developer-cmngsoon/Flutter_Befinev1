import 'package:flutter/material.dart';
import 'package:befine_app/models/user_model.dart';
import 'package:befine_app/services/hive_user_service.dart'; // ✅ Nuevo servicio

/// Widget de formulario para registrar un nuevo usuario.
/// Guarda usuarios en almacenamiento local usando Hive.
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';

  /// Método que se ejecuta al presionar el botón "Registrar"
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newUser = User(
        name: _name,
        email: _email,
        password: _password,
        role: 'cliente',
      );

      final success = await HiveUserService.addUser(newUser); // ✅

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registro exitoso para $_name')),
        );
        // Aquí podrías limpiar el formulario o redirigir al login
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ya existe un usuario con ese correo')),
        );
      }
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

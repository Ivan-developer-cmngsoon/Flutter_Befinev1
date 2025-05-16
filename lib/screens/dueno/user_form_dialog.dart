import 'package:flutter/material.dart';
import 'package:befine_app/models/user_model.dart';

class UserFormDialog extends StatefulWidget {
  final User? usuario;
  final void Function(User) onSave;

  const UserFormDialog({
    super.key,
    this.usuario,
    required this.onSave,
  });

  @override
  State<UserFormDialog> createState() => _UserFormDialogState();
}

class _UserFormDialogState extends State<UserFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _password;
  late String _role;

  final List<String> _rolesDisponibles = ['cliente', 'admin', 'dueno'];

  @override
  void initState() {
    super.initState();
    final u = widget.usuario;
    _name = u?.name ?? '';
    _email = u?.email ?? '';
    _password = u?.password ?? '';
    _role = u?.role ?? 'cliente';
  }

  @override
  Widget build(BuildContext context) {
    final esEdicion = widget.usuario != null;

    return AlertDialog(
      title: Text(esEdicion ? 'Editar Usuario' : 'Nuevo Usuario'),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: _name,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  onSaved: (val) => _name = val!.trim(),
                  validator: (val) =>
                      val == null || val.isEmpty ? 'Ingresa un nombre' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  enabled: !esEdicion,
                  initialValue: _email,
                  decoration: const InputDecoration(labelText: 'Email'),
                  onSaved: (val) => _email = val!.trim(),
                  validator: (val) =>
                      val == null || !val.contains('@') ? 'Correo inválido' : null,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: _password,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  onSaved: (val) => _password = val!.trim(),
                  validator: (val) =>
                      val == null || val.length < 6 ? 'Mínimo 6 caracteres' : null,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _role,
                  items: _rolesDisponibles
                      .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                      .toList(),
                  onChanged: (val) => setState(() => _role = val!),
                  decoration: const InputDecoration(labelText: 'Rol'),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              final nuevoUsuario = User(
                name: _name,
                email: _email,
                password: _password,
                role: _role,
              );
              widget.onSave(nuevoUsuario);
              Navigator.pop(context);
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}

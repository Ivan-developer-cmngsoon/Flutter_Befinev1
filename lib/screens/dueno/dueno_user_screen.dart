import 'package:flutter/material.dart';
import 'package:befine_app/models/user_model.dart';
import 'package:befine_app/services/hive_user_service.dart';
import 'package:befine_app/services/session_service.dart';
import 'user_form_dialog.dart'; // ✅ Importamos el formulario

class DuenoUserScreen extends StatefulWidget {
  const DuenoUserScreen({super.key});

  @override
  State<DuenoUserScreen> createState() => _DuenoUserScreenState();
}

class _DuenoUserScreenState extends State<DuenoUserScreen> {
  late List<User> _usuarios;

  @override
  void initState() {
    super.initState();
    _usuarios = HiveUserService.getAllUsers();
  }

  void _refrescarUsuarios() {
    setState(() {
      _usuarios = HiveUserService.getAllUsers();
    });
  }

  void _eliminarUsuario(User usuario) async {
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('¿Eliminar usuario?'),
        content: Text('¿Estás seguro de eliminar a ${usuario.name}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Eliminar')),
        ],
      ),
    );

    if (confirmado == true) {
      await HiveUserService.deleteUser(usuario.email);
      _refrescarUsuarios();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${usuario.name} fue eliminado')),
      );
    }
  }

  void _mostrarFormulario({User? usuario}) {
    showDialog(
      context: context,
      builder: (_) => UserFormDialog(
        usuario: usuario,
        onSave: (User user) async {
          if (usuario == null) {
            // Crear
            final ok = await HiveUserService.addUser(user);
            if (!ok) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ya existe un usuario con ese correo')),
              );
              return;
            }
          } else {
            // Editar
            await HiveUserService.updateUser(user);
          }
          _refrescarUsuarios();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userLogueado = SessionService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Usuarios'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarFormulario(),
        child: const Icon(Icons.add),
      ),
      body: _usuarios.isEmpty
          ? const Center(child: Text('No hay usuarios registrados'))
          : ListView.builder(
              itemCount: _usuarios.length,
              itemBuilder: (context, index) {
                final user = _usuarios[index];
                final esMismo = user.email == userLogueado?.email;

                return ListTile(
                  title: Text(user.name),
                  subtitle: Text('${user.email} • ${user.role}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _mostrarFormulario(usuario: user),
                      ),
                      if (!esMismo)
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _eliminarUsuario(user),
                        ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

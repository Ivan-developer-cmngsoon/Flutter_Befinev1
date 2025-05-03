import 'package:flutter/material.dart';
import 'package:befine_app/services/session_service.dart';

/// Menú lateral para el administrador.
/// Permite acceder a gestión de pedidos, productos y cerrar sesión.
class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Text(
              'Menú del Admin',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Revisión de Pedidos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Productos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.pop(context);
              SessionService.logoutAndRedirect(context);
            },
          ),
        ],
      ),
    );
  }
}

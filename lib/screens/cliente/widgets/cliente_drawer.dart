import 'package:flutter/material.dart';
import 'package:befine_app/services/session_service.dart';

/// Menú lateral para el cliente.
/// Incluye acceso a historial, pedidos y opción de cerrar sesión.
class ClienteDrawer extends StatelessWidget {
  const ClienteDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menú del Cliente',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Historial de Pedidos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Nuevo Pedido'),
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

import 'package:flutter/material.dart';
import 'package:befine_app/services/session_service.dart';

/// Menú lateral personalizado para el usuario dueño.
/// Permite navegar entre las secciones del panel y cerrar sesión.
class DuenoDrawer extends StatelessWidget {
  const DuenoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Encabezado visual del drawer
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú del Dueño',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          // Opción: Gestión de productos
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Productos'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              // Aquí se puede navegar a productos en el futuro
            },
          ),

          // Opción: Gestión de usuarios
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Usuarios'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // Opción: Reportes
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Reportes'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // Opción: Configuración
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const Divider(),

          // Opción: Cerrar sesión con redirección
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              SessionService.logoutAndRedirect(context); // Llama al servicio centralizado
            },
          ),
        ],
      ),
    );
  }
}

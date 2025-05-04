import 'package:flutter/material.dart';
import 'package:befine_app/services/session_service.dart';
import 'package:befine_app/screens/cliente/cliente_products_screen.dart';
import 'package:befine_app/screens/cliente/cliente_cart_screen.dart';


/// Menú lateral para el cliente.
/// Incluye acceso al catálogo, historial, pedidos y opción de cerrar sesión.
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

          // 🆕 Nuevo: Acceso al catálogo de productos
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Ver Productos'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ClienteProductsScreen()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Mi Carrito'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ClienteCartScreen()),
              );
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

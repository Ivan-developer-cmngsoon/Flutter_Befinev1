import 'package:flutter/material.dart';
import 'package:befine_app/screens/cliente/cliente_products_screen.dart';
import 'package:befine_app/screens/cliente/cliente_historial_screen.dart';

/// Cuerpo principal del cliente con tarjetas de acceso rápido.
class ClienteHomeBody extends StatelessWidget {
  const ClienteHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Center(
          child: Text(
            '👤 Panel del Cliente',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'Realiza pedidos, revisa tu historial y aprovecha promociones.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 32),

        // Tarjeta: Ver productos
        _buildCard(
          context,
          title: 'Ver productos disponibles',
          icon: Icons.storefront,
          color: Colors.blueAccent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ClienteProductsScreen()),
            );
          },
        ),

        const SizedBox(height: 16),

        // Tarjeta: Historial de pedidos
        _buildCard(
          context,
          title: 'Historial de pedidos',
          icon: Icons.history,
          color: Colors.deepOrange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ClienteHistorialScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

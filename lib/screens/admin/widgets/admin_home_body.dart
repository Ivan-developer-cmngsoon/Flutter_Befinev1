import 'package:flutter/material.dart';

/// Vista principal del panel de administrador.
///
/// Muestra accesos rápidos a gestión de productos, pedidos y reportes.
class AdminHomeBody extends StatelessWidget {
  const AdminHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _AdminCard(
            icon: Icons.inventory_2,
            title: 'Productos',
            color: Colors.blueAccent,
            onTap: () {
              // TODO: Navegar a gestión de productos
            },
          ),
          _AdminCard(
            icon: Icons.receipt_long,
            title: 'Pedidos',
            color: Colors.green,
            onTap: () {
              // TODO: Navegar a pedidos en curso
            },
          ),
          _AdminCard(
            icon: Icons.bar_chart,
            title: 'Reportes',
            color: Colors.deepPurple,
            onTap: () {
              // TODO: Navegar a sección de reportes
            },
          ),
          _AdminCard(
            icon: Icons.settings,
            title: 'Configuración',
            color: Colors.grey,
            onTap: () {
              // TODO: Navegar a configuración
            },
          ),
        ],
      ),
    );
  }
}

/// Tarjeta individual del panel administrador.
class _AdminCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _AdminCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 1),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

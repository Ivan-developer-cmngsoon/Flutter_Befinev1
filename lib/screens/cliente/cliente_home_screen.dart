import 'package:flutter/material.dart';
import 'cliente_products_screen.dart';

/// Pantalla principal del cliente.
/// Aquí se mostrarán los productos disponibles, promociones y pedidos.
class ClienteHomeScreen extends StatelessWidget {
  const ClienteHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Vista del Cliente\n(Pedidos, Promociones, Historial)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),

            // Botón para ver productos disponibles
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ClienteProductsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_basket),
              label: const Text('Ver productos disponibles'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

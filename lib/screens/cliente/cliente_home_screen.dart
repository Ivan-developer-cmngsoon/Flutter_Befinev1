import 'package:flutter/material.dart';
import 'package:befine_app/services/cart_service.dart';
import 'cliente_products_screen.dart';
import 'cliente_cart_screen.dart';

/// Pantalla principal del cliente.
/// Muestra productos, promociones y acceso al carrito con contador dinámico.
class ClienteHomeScreen extends StatefulWidget {
  const ClienteHomeScreen({super.key});

  @override
  State<ClienteHomeScreen> createState() => _ClienteHomeScreenState();
}

class _ClienteHomeScreenState extends State<ClienteHomeScreen> {
  /// Refresca el contador cada vez que se vuelve a esta pantalla
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final int itemCount = CartService.getItemCount();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido Cliente'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ClienteCartScreen()),
                  ).then((_) => setState(() {})); // Refresca al volver
                },
              ),
              if (itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.redAccent,
                    child: Text(
                      '$itemCount',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
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
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ClienteProductsScreen()),
                ).then((_) => setState(() {})); // Refresca al volver
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

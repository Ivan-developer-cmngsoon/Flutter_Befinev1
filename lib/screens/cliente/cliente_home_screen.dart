import 'package:flutter/material.dart';
import 'package:befine_app/services/cart_service.dart';
import 'package:befine_app/screens/cliente/cliente_products_screen.dart';
import 'package:befine_app/screens/cliente/cliente_cart_screen.dart';
import 'package:befine_app/screens/cliente/cliente_historial_screen.dart';
import 'package:befine_app/screens/cliente/widgets/cliente_drawer.dart';

/// Pantalla principal tipo Dashboard del cliente con Drawer integrado.
/// Muestra accesos rápidos, promociones y el contador de ítems en el carrito.
class ClienteHomeScreen extends StatefulWidget {
  const ClienteHomeScreen({super.key});

  @override
  State<ClienteHomeScreen> createState() => _ClienteHomeScreenState();
}

class _ClienteHomeScreenState extends State<ClienteHomeScreen> {
  int _itemCount = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCartCount();
  }

  void _updateCartCount() {
    setState(() {
      _itemCount = CartService.getItemCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido, Carlos Cliente'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ClienteCartScreen()),
                  );
                  _updateCartCount();
                },
              ),
              if (_itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.redAccent,
                    child: Text(
                      '$_itemCount',
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
      drawer: const ClienteDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'Panel del Cliente',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Aquí podrás realizar pedidos, ver promociones y tu historial.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ClienteProductsScreen()),
                );
                _updateCartCount();
              },
              icon: const Icon(Icons.storefront),
              label: const Text('Ver productos disponibles'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ClienteHistorialScreen()),
                );
              },
              icon: const Icon(Icons.history),
              label: const Text('Ver historial de pedidos'),
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

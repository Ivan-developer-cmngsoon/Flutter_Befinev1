import 'package:flutter/material.dart';
import 'package:befine_app/services/cart_service.dart';
import 'package:befine_app/screens/cliente/widgets/cliente_drawer.dart';
import 'package:befine_app/screens/cliente/widgets/cliente_home_body.dart';

/// Pantalla principal tipo Dashboard del cliente con Drawer integrado.
/// Incluye contador de carrito y vista modular desde [ClienteHomeBody].
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
        title: const Text('Bienvenido}'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () async {
                  // Redirige al carrito y actualiza contador al volver
                  await Navigator.pushNamed(context, '/cliente/cart');
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
      body: const ClienteHomeBody(),
    );
  }
}

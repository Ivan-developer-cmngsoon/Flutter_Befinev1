import 'package:flutter/material.dart';
import 'package:befine_app/models/product_model.dart';
import 'package:befine_app/models/pedido_model.dart';
import 'package:befine_app/services/cart_service.dart';
import 'package:befine_app/services/pedido_service.dart';

/// Pantalla que muestra los productos agregados al carrito del cliente.
///
/// Integra persistencia: cada acción sobre el carrito se guarda automáticamente.
/// Permite ver cada producto, modificar cantidades, eliminar productos,
/// ver el total y confirmar el pedido.
class ClienteCartScreen extends StatefulWidget {
  const ClienteCartScreen({super.key});

  @override
  State<ClienteCartScreen> createState() => _ClienteCartScreenState();
}

class _ClienteCartScreenState extends State<ClienteCartScreen> {
  /// Refresca la interfaz y guarda el carrito actualizado
  void _refreshCart() {
    setState(() {});
    CartService.saveCart(); // Guarda persistencia local
  }

  @override
  Widget build(BuildContext context) {
    final Map<Product, int> cartItems = CartService.getCartItems();
    final double total = CartService.getTotal();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Pedido'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Tu carrito está vacío',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                // Lista de productos con sus cantidades
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems.keys.elementAt(index);
                      final quantity = cartItems[product]!;

                      return ListTile(
                        leading: Image.network(
                          product.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.broken_image),
                        ),
                        title: Text(product.name),
                        subtitle: Text('\$${product.price.toStringAsFixed(0)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                CartService.removeOne(product);
                                _refreshCart();
                              },
                            ),
                            Text(quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                CartService.addToCart(product);
                                _refreshCart();
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                CartService.removeProduct(product);
                                _refreshCart();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${product.name} eliminado del carrito'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const Divider(),

                // Sección total y botón confirmar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${total.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (cartItems.isEmpty) return;

                          final nuevoPedido = Pedido(
                            id: DateTime.now().millisecondsSinceEpoch.toString(),
                            fecha: DateTime.now(),
                            productos: Map<Product, int>.from(cartItems),
                            total: total,
                          );

                          await PedidoService.guardarPedido(nuevoPedido);
                          CartService.clearCart();
                          _refreshCart();

                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Pedido confirmado y guardado'),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Confirmar Pedido'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

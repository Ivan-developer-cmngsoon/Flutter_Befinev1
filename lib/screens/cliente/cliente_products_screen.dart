import 'package:flutter/material.dart';
import 'package:befine_app/data/mock_products.dart';
import 'package:befine_app/widgets/product_card.dart';

/// Pantalla que muestra una lista de productos disponibles para el cliente.
///
/// Utiliza una lista simulada de productos (`mockProducts`) y representa
/// cada uno con el widget reutilizable `ProductCard`.
class ClienteProductsScreen extends StatelessWidget {
  const ClienteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos disponibles'),
      ),
      body: ListView.builder(
        itemCount: mockProducts.length,
        itemBuilder: (context, index) {
          final product = mockProducts[index];

          return ProductCard(
            product: product,
            onAdd: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.name} agregado al pedido')),
              );
            },
          );
        },
      ),
    );
  }
}

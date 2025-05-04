import 'package:flutter/material.dart';
import 'package:befine_app/models/product_model.dart';
import 'package:befine_app/services/cart_service.dart';

/// Widget reutilizable que representa visualmente un producto.
/// Incluye imagen, nombre, descripción, precio y botón de agregar al carrito.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  /// Lógica de acción al presionar el botón "Agregar"
  /// Agrega el producto al carrito y muestra notificación.
  void _handleAddToCart(BuildContext context) {
    CartService.addToCart(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} agregado al carrito'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              product.imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100, color: Colors.grey),
            ),
          ),

          // Detalles del producto
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _handleAddToCart(context),
                      icon: const Icon(Icons.add_shopping_cart, size: 18),
                      label: const Text('Agregar'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

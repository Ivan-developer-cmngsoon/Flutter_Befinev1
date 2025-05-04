/// Modelo de datos para representar un pedido realizado por el cliente.
///
/// Cada pedido incluye un ID único, la fecha en que fue realizado,
/// una lista de productos con sus cantidades y el total del pedido.

import 'package:befine_app/models/product_model.dart';

class Pedido {
  final String id;
  final DateTime fecha;
  final Map<Product, int> productos;
  final double total;

  Pedido({
    required this.id,
    required this.fecha,
    required this.productos,
    required this.total,
  });

  /// Convierte un Pedido en un Map para almacenamiento local (JSON-like)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fecha': fecha.toIso8601String(),
      'total': total,
      'productos': productos.entries.map((e) => {
            'id': e.key.id,
            'name': e.key.name,
            'price': e.key.price,
            'quantity': e.value,
            'imageUrl': e.key.imageUrl,
          }).toList(),
    };
  }

  /// Crea un Pedido a partir de un Map (JSON-like)
  factory Pedido.fromJson(Map<String, dynamic> json) {
    final List productosJson = json['productos'];
    final Map<Product, int> productosMap = {
      for (var item in productosJson)
        Product(
          id: item['id'],
          name: item['name'],
          price: item['price'].toDouble(),
          imageUrl: item['imageUrl'],
          description: '',
          type: '',
          stock: 0,
        ): item['quantity'],
    };

    return Pedido(
      id: json['id'],
      fecha: DateTime.parse(json['fecha']),
      total: json['total'].toDouble(),
      productos: productosMap,
    );
  }
}

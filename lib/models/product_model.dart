/// Modelo de datos para productos en la app Befine.
/// Representa un producto que puede ser vendido (agua, dispensador o accesorio),
/// con atributos básicos como id, nombre, precio, imagen, tipo y stock disponible.

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String type; // 'agua', 'dispensador', 'accesorio'
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.type,
    required this.stock,
  });
}
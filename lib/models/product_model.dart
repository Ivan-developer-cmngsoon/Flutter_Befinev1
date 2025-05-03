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

/// Lista de productos simulados para pruebas sin conexión.
/// Esta lista puede reemplazarse por Firebase o API más adelante.
final List<Product> mockProducts = [
  Product(
    id: 'p1',
    name: 'Bidón 20L',
    description: 'Agua purificada en envase retornable de 20 litros.',
    price: 2500,
    imageUrl: 'https://i.imgur.com/7VJXwUI.png',
    type: 'agua',
    stock: 50,
  ),
  Product(
    id: 'p2',
    name: 'Dispensador Eléctrico',
    description: 'Dispensador con sistema de compresor frío/calor.',
    price: 115000,
    imageUrl: 'https://i.imgur.com/8tVjqRA.png',
    type: 'dispensador',
    stock: 10,
  ),
  Product(
    id: 'p3',
    name: 'Manilla para bidón',
    description: 'Accesorio para transportar fácilmente el bidón.',
    price: 3000,
    imageUrl: 'https://i.imgur.com/0IQAZ3J.png',
    type: 'accesorio',
    stock: 100,
  ),
];

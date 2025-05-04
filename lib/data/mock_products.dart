import 'package:befine_app/models/product_model.dart';

/// Lista de productos simulados para pruebas locales sin conexión.
/// Esta lista puede ser reemplazada por Firebase o una API real más adelante.
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

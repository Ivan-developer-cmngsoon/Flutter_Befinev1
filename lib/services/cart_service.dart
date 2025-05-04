import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:befine_app/models/product_model.dart';

/// Servicio singleton para manejar el carrito de compras.
/// Incluye persistencia local usando SharedPreferences.
class CartService {
  static final Map<Product, int> _cartItems = {};

  /// Agrega una unidad de un producto
  static void addToCart(Product product) {
    _cartItems.update(product, (qty) => qty + 1, ifAbsent: () => 1);
    saveCart();
  }

  /// Resta una unidad de un producto
  static void removeOne(Product product) {
    if (_cartItems.containsKey(product)) {
      final current = _cartItems[product]!;
      if (current > 1) {
        _cartItems[product] = current - 1;
      } else {
        _cartItems.remove(product);
      }
      saveCart();
    }
  }

  /// Elimina por completo un producto del carrito
  static void removeProduct(Product product) {
    _cartItems.remove(product);
    saveCart();
  }

  /// Limpia todo el carrito
  static void clearCart() {
    _cartItems.clear();
    saveCart();
  }

  /// Devuelve un mapa inmodificable del carrito actual
  static Map<Product, int> getCartItems() => Map.unmodifiable(_cartItems);

  /// Retorna el total de ítems en el carrito
  static int getItemCount() =>
      _cartItems.values.fold(0, (sum, qty) => sum + qty);

  /// Calcula el total a pagar
  static double getTotal() => _cartItems.entries.fold(
        0,
        (sum, e) => sum + e.key.price * e.value,
      );

  // === PERSISTENCIA LOCAL CON SHARED PREFERENCES ===

  static Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();

    // Convierte el carrito a una lista de Map
    final cartJson = _cartItems.entries.map((e) => {
          'product': {
            'id': e.key.id,
            'name': e.key.name,
            'description': e.key.description,
            'price': e.key.price,
            'imageUrl': e.key.imageUrl,
            'type': e.key.type,
            'stock': e.key.stock,
          },
          'quantity': e.value
        }).toList();

    await prefs.setString('cart', jsonEncode(cartJson));
  }

  static Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartString = prefs.getString('cart');

    if (cartString == null) return;

    final List decoded = jsonDecode(cartString);

    _cartItems.clear();
    for (final item in decoded) {
      final productData = item['product'];
      final quantity = item['quantity'];

      final product = Product(
        id: productData['id'],
        name: productData['name'],
        description: productData['description'],
        price: (productData['price'] as num).toDouble(),
        imageUrl: productData['imageUrl'],
        type: productData['type'],
        stock: productData['stock'],
      );

      _cartItems[product] = quantity;
    }
  }
}

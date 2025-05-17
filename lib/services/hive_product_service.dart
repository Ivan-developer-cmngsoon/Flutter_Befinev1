import 'package:hive/hive.dart';
import 'package:befine_app/models/product_model.dart';

class HiveProductService {
  static final Box<Product> _productBox = Hive.box<Product>('productsBox');

  /// Retorna todos los productos registrados
  static List<Product> getAllProducts() {
    return _productBox.values.toList();
  }

  /// Busca un producto por su ID
  static Product? getProductById(String id) {
    try {
      return _productBox.values.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Agrega un nuevo producto si no existe uno con el mismo ID
  static Future<bool> addProduct(Product newProduct) async {
    final exists = _productBox.values.any((p) => p.id == newProduct.id);
    if (exists) return false;

    await _productBox.add(newProduct);
    return true;
  }

  /// Actualiza un producto existente según su ID
  static Future<bool> updateProduct(Product updatedProduct) async {
    final key = _productBox.keys.firstWhere(
      (k) => _productBox.get(k)?.id == updatedProduct.id,
      orElse: () => null,
    );

    if (key != null) {
      await _productBox.put(key, updatedProduct);
      return true;
    }
    return false;
  }

  /// Elimina un producto por su ID
  static Future<void> deleteProduct(String id) async {
    final key = _productBox.keys.firstWhere(
      (k) => _productBox.get(k)?.id == id,
      orElse: () => null,
    );

    if (key != null) {
      await _productBox.delete(key);
    }
  }

  /// Limpia toda la caja de productos (útil para pruebas)
  static Future<void> clearAll() async {
    await _productBox.clear();
  }
}

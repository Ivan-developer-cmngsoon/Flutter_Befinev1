import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:befine_app/models/product_model.dart';
import 'package:befine_app/models/pedido_model.dart';

/// Servicio para gestionar los pedidos del cliente de forma local.
/// Simula una base de datos usando SharedPreferences.
class PedidoService {
  static const String _storageKey = 'befine_pedidos';

  /// Guarda un nuevo pedido en la lista local.
  static Future<void> guardarPedido(Pedido pedido) async {
    final prefs = await SharedPreferences.getInstance();
    final pedidosData = prefs.getStringList(_storageKey) ?? [];

    pedidosData.add(jsonEncode(pedido.toJson()));
    await prefs.setStringList(_storageKey, pedidosData);
  }

  /// Obtiene todos los pedidos guardados localmente.
  static Future<List<Pedido>> obtenerPedidos() async {
    final prefs = await SharedPreferences.getInstance();
    final pedidosData = prefs.getStringList(_storageKey) ?? [];

    return pedidosData.map((pedidoJson) {
      final Map<String, dynamic> json = jsonDecode(pedidoJson);
      return Pedido.fromJson(json);
    }).toList();
  }

  /// Limpia todos los pedidos (para pruebas o reinicio).
  static Future<void> borrarHistorial() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}

import 'package:flutter/material.dart';
import 'package:befine_app/models/pedido_model.dart';
import 'package:befine_app/services/pedido_service.dart';
import 'package:befine_app/services/cart_service.dart';
import 'package:intl/intl.dart';

/// Pantalla que muestra el historial de pedidos del cliente.
/// Cada tarjeta incluye: ID, fecha, cantidad de productos y total.
/// Se puede repetir el pedido con un botón.
class ClienteHistorialScreen extends StatefulWidget {
  const ClienteHistorialScreen({super.key});

  @override
  State<ClienteHistorialScreen> createState() => _ClienteHistorialScreenState();
}

class _ClienteHistorialScreenState extends State<ClienteHistorialScreen> {
  List<Pedido> _pedidos = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarPedidos();
  }

  /// Carga el historial de pedidos desde SharedPreferences
  Future<void> _cargarPedidos() async {
    final pedidos = await PedidoService.obtenerPedidos();
    setState(() {
      _pedidos = pedidos;
      _cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Pedidos'),
      ),
      body: _cargando
          ? const Center(child: CircularProgressIndicator())
          : _pedidos.isEmpty
              ? const Center(
                  child: Text(
                    'Aún no has realizado pedidos.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: _pedidos.length,
                  itemBuilder: (context, index) {
                    final pedido = _pedidos[index];
                    final fecha = DateFormat('dd/MM/yyyy – HH:mm').format(pedido.fecha);
                    final cantidad = pedido.productos.values.fold(0, (sum, qty) => sum + qty);

                    return Card(
                      margin: const EdgeInsets.all(12),
                      elevation: 4,
                      child: ListTile(
                        title: Text('Pedido #${pedido.id}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Fecha: $fecha'),
                            Text('Productos: $cantidad'),
                            Text('Total: \$${pedido.total.toStringAsFixed(0)}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.repeat),
                          tooltip: 'Repetir pedido',
                          onPressed: () {
                            for (var entry in pedido.productos.entries) {
                              for (var i = 0; i < entry.value; i++) {
                                CartService.addToCart(entry.key);
                              }
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Pedido agregado al carrito')),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

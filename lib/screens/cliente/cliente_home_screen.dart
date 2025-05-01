import 'package:flutter/material.dart';

/// Pantalla principal del cliente.
/// Aquí se mostrarán los productos disponibles, promociones y pedidos.
class ClienteHomeScreen extends StatelessWidget {
  const ClienteHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido Cliente'),
      ),
      body: const Center(
        child: Text(
          'Vista del Cliente\n(Pedidos, Promociones, Historial)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

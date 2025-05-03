import 'package:flutter/material.dart';

/// Vista principal para el rol de Cliente.
/// Aquí se mostrarán productos, promociones, historial, etc.
class ClienteHomeBody extends StatelessWidget {
  const ClienteHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '👤 Panel del Cliente\nAquí podrás realizar pedidos, ver promociones y tu historial.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

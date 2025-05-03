import 'package:flutter/material.dart';

/// Vista principal para el rol de Administrador.
/// Aquí se mostrarán pedidos en curso, gestión de productos, reportes, etc.
class AdminHomeBody extends StatelessWidget {
  const AdminHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '🛠️ Panel del Administrador\nAquí podrás revisar pedidos, gestionar productos y ver reportes.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

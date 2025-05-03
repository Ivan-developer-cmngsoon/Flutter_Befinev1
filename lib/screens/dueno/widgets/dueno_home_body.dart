import 'package:flutter/material.dart';

/// Vista principal para el rol de Dueño.
/// Aquí se mostrarán reportes generales, configuración avanzada y gestión de usuarios.
class DuenoHomeBody extends StatelessWidget {
  const DuenoHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '👑 Panel del Dueño\nGestión avanzada, usuarios, reportes financieros y configuraciones globales.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

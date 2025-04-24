import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio - Befine 💧'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a la app de ventas Befine',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

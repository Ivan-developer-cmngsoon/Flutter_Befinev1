import 'package:flutter/material.dart';
import 'package:befine_app/screens/home/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a Befine 💧'),
      ),
      body: const HomeBody(),
    );
  }
}

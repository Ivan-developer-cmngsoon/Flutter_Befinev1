import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '¡Tu app ya está funcionando!',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const BefineApp());
}

class BefineApp extends StatelessWidget {
  const BefineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agua Purificada Befine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'widgets/login_form.dart';
import 'register_screen.dart'; // Importación para navegar desde el login

/// Pantalla principal para que el usuario inicie sesión.
///
/// Contiene un título, el formulario de login y un botón para ir al registro.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Expanded(child: LoginForm()),

            // Botón para navegar a la pantalla de registro
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text('¿No tienes cuenta? Regístrate aquí'),
            ),
          ],
        ),
      ),
    );
  }
}

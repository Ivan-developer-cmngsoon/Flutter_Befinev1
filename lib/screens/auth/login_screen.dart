import 'package:flutter/material.dart';
import 'widgets/login_form.dart'; // Contiene el formulario funcional
import 'register_screen.dart';   // Para navegación al registro

/// Pantalla de inicio de sesión principal de la app Befine.
/// 
/// Esta pantalla contiene:
/// - El título "Iniciar Sesión"
/// - El formulario funcional de inicio de sesión (`LoginForm`)
/// - Un botón que permite al usuario nuevo ir a la pantalla de registro.
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
            /// Formulario de login
            const Expanded(
              child: LoginForm(),
            ),

            /// Botón para navegar a la pantalla de registro
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RegisterScreen(),
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

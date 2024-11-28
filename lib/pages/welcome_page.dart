import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Filtro de opacidad
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.8), // Opacidad del filtro
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nombre de la aplicación
                const Text(
                  'C.C.E.G.',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Logo
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('lib/assets/images/logo.png'), // Cambia al nombre de tu logo
                ),

                const SizedBox(height: 40),

                // Botón de inicio
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Iniciar',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                
                const SizedBox(height: 30),

                const Text(
                  'CURSOS ONLINE',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black54,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
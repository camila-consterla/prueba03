import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio Profesor'),
        backgroundColor: Colors.blueAccent,
        actions: [
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('lib/assets/images/profesor.png'), 
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const Text(
              'Hola, Camila',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, 
              ),
            ),
            const SizedBox(height: 20),
            
            // Apartados 
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, 
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildCard('Cursos Impartidos', Colors.blue[200]!, Icons.book),                  
                  _buildCard('Material Cursos', Colors.blue[300]!, Icons.folder),                  
                  _buildCard('Foros', Colors.blue[400]!, Icons.forum),                  
                  _buildCard(
                    'Administrar Cursos',
                    Colors.blue[500]!,
                    Icons.settings,
                    onTap: () {
                      // Redirige a Home
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Función para construir las tarjetas
  Widget _buildCard(String title, Color color, IconData icon, {Function? onTap}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Card(
        color: color,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
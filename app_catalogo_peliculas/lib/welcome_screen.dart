import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos Container para definir el fondo de toda la pantalla
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.black],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Widget de Stack para el Logo y un posible brillo de fondo
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.movie_filter,
                  size: 120,
                  color: Colors.redAccent.withOpacity(0.3),
                ),
                Icon(
                  Icons.movie,
                  size: 100,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 30),
            // Widget de Text para el Título
            Text(
              'CINEVERSE',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            Text(
              'Tu catálogo de películas',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 60),
            // Widget de Container y Text para el Botón personalizado
            GestureDetector(
              onTap: () {
                print("Ir al catálogo");
                // Aquí agregarás la navegación a la pantalla de géneros
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.4),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  'INGRESAR AL CATÁLOGO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
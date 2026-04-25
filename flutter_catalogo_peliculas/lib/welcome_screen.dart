import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // --- AQUÍ AGREGAMOS LA IMAGEN ---
          image: DecorationImage(
            image: NetworkImage(
              'https://eltelevisero.huffingtonpost.es/wp-content/uploads/2024/03/netflix-catalogo-1046x616.jpeg', // Imagen
            ),
            fit: BoxFit.cover, // Para que cubra toda la pantalla
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6), // Oscurece la imagen para que el texto resalte
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 30),
            const Text(
              'CINEVERSE',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            const Text(
              '¡Bienvenido a tu catálogo de películas!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                print("Ir al catálogo");
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Text(
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
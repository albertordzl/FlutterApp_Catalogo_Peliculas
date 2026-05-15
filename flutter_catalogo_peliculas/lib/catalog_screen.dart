import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Películas'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<QuerySnapshot>(
        // Escuchamos la colección "peliculas" de Firestore
        stream: FirebaseFirestore.instance.collection('peliculas').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // ... dentro del ListView en catalog_screen.dart ...

return ListView(
  children: snapshot.data!.docs.map((DocumentSnapshot document) {
    // Extraemos los datos del documento de Firestore
    Map<String, dynamic> movie = document.data()! as Map<String, dynamic>;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Un gris muy oscuro para resaltar
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Imagen (Cambiado de 'poster_url' a 'Imagen')
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              movie['Imagen'] ?? 'https://via.placeholder.com/150',
              width: 110,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          
          // 2. Información Detallada
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                Text(
                  movie['Título'] ?? 'Sin título',
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 18, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 4),
                // Género y Año (Usando Row para que queden en la misma línea)
                Row(
                  children: [
                    Text(
                      movie['Género'] ?? 'Género',
                      style: const TextStyle(color: Colors.redAccent, fontSize: 14),
                    ),
                    const Text(' • ', style: TextStyle(color: Colors.white54)),
                    Text(
                      movie['Año']?.toString() ?? 'N/A',
                      style: const TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Director
                Text(
                  'Director: ${movie['Director'] ?? 'Desconocido'}',
                  style: const TextStyle(color: Colors.white70, fontSize: 13, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 8),
                // Sinopsis (Limitada a 2 líneas para que no rompa el diseño del catálogo)
                Text(
                  movie['Sinopsis'] ?? 'Sin descripción disponible.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
                const SizedBox(height: 12),
                // Botón de detalle
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Aquí pasaremos todo el objeto 'movie' a la siguiente pantalla
                    },
                    child: const Text('VER MÁS'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }).toList(),
);
        },
      ),
    );
  }
}
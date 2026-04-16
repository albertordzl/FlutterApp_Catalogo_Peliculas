import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'CineVerse', // Cambiamos el nombre
        debugShowCheckedModeBanner: false, // Quita la banda roja de "debug"
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red), // Rojo Cine
        ),
        // CAMBIO CLAVE: Aquí llamamos a tu nueva pantalla
        home: WelcomeScreen(), 
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {

}

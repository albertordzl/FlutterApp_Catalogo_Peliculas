import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa Firebase
import 'firebase_options.dart'; // Este archivo se generó con flutterfire configure

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicialización de Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'CineVerse',
        debugShowCheckedModeBanner: false,
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

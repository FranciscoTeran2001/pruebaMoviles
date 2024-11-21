import 'package:flutter/material.dart';
import 'ui/pantalla_principal.dart'; // Asegúrate de que la ruta esté correcta

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verificar Capicúa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  PantallaPrincipal(),
    );
  }
}


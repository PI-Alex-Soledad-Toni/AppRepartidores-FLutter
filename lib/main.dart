import 'package:flutter/material.dart';

void main() {
  runApp(const BatoiLogicApp());
}

class BatoiLogicApp extends StatelessWidget {
  const BatoiLogicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BatoiLOGIC',
      debugShowCheckedModeBanner: false,

      // Configuración visual general de la aplicación.
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF166534),
          primary: const Color(0xFF166534),
          secondary: const Color(0xFF16A34A),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF166534),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      // Pantalla provisional hasta integrar el login de Toni.
      home: const InicioProvisional(),
    );
  }
}

class InicioProvisional extends StatelessWidget {
  const InicioProvisional({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'BatoiLOGIC',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF166534),
          ),
        ),
      ),
    );
  }
}

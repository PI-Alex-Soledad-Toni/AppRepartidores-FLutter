import 'package:flutter/material.dart';
import 'presentation/screens/pantalla_login.dart';


void main() {
  runApp(const BatoiLogicApp());
}

class BatoiLogicApp extends StatelessWidget {
  const BatoiLogicApp({super.key});
  static const _titulo= 'BatoiLogic';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _titulo,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF166534),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_titulo),),
        body: const PantallaLogin(),
      ),
    );
  }
}
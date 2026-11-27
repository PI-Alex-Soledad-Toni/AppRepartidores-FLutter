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
        appBar: AppBar(
          backgroundColor: const  Color(0xFF166534),
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height / 3,
          flexibleSpace: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    heightFactor: 0.8,
                    child: Image.asset(
                      'assets/imagenes/logo_batoilogic.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Text(
                  'ÁREA  DE REPARTIDOR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
        body: const PantallaLogin(),
      ),
    );
  }
}
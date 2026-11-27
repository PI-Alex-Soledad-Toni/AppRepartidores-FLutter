
import 'package:flutter/material.dart';
import 'presentation/screens/pantalla_login.dart';

void main() {
  runApp(const BatoiLogicApp());
}

class BatoiLogicApp extends StatelessWidget {
  const BatoiLogicApp({super.key});

  static const _titulo = 'BatoiLogic';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _titulo,
      debugShowCheckedModeBanner: false,

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

      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF166534),
          elevation: 0,
          toolbarHeight:
          MediaQuery.of(context).orientation == Orientation.landscape
              ? MediaQuery.of(context).size.height * 0.15
              : MediaQuery.of(context).size.height / 3,
          flexibleSpace: Center(
            child: MediaQuery.of(context).orientation ==
                Orientation.landscape
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.19,
                  child: Image.asset(
                    'assets/imagenes/logo_batoilogic.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 40),
                const Text(
                  'ÁREA DE REPARTIDOR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
                : Column(
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
                  'ÁREA DE REPARTIDOR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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

import 'package:flutter/material.dart';
import '../../domain/services/servicio_autenticacion.dart';
import '../widgets/campo_texto_personalizado.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final TextEditingController controladorUsuario = TextEditingController();

  final TextEditingController controladorContrasena = TextEditingController();

  bool ocultarContrasena = true;
  bool estaCargando = false;

  Future<void> iniciarSesion() async {
    final usuario = controladorUsuario.text.trim();
    final contrasena = controladorContrasena.text.trim();

    if (usuario.isEmpty || contrasena.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingrese un usuario y contraseña válidos.'),
        ),
      );
      return;
    }

    setState(() {
      estaCargando = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    final accesoCorrecto = ServicioAutenticacion.iniciarSesion(
        usuario, contrasena);

    if (!mounted) return;

    setState(() {
      estaCargando = false;
    });

    if (accesoCorrecto) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inicio de sesión exitoso.'),
          backgroundColor: Color(0xFF15803D),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos.'),
          backgroundColor: Color(0xFFB00020),
        ),
      );
    }
  }

  @override
  void dispose() {
    controladorUsuario.dispose();
    controladorContrasena.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/imagenes/logo_batoilogic.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    'Tu jornada empieza aqui',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF263746),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Accede para gestionar tus entregas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF64748B),
                    ),
                  ),

                  const SizedBox(height: 32),

                  CampoTextoPersonalizado(
                    etiqueta: 'Usuario',
                    textoAyuda: 'Ingresa tu usuario',
                    icono: Icons.person_outline,
                    controlador: controladorUsuario,
                  ),

                  const SizedBox(height: 20),

                  CampoTextoPersonalizado(
                    etiqueta: 'contraseña',
                    textoAyuda: 'Ingresa tu contraseña',
                    icono: Icons.lock_outline,
                    controlador: controladorContrasena,
                    ocultarTexto: ocultarContrasena,
                    iconFinal: IconButton(
                      icon: Icon(
                        ocultarContrasena ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          ocultarContrasena = !ocultarContrasena;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 28),

                  ElevatedButton(
                    onPressed: estaCargando ? null : iniciarSesion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF16A34A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: estaCargando
                        ? const CircularProgressIndicator(color: Colors.white,)
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Iniciar sesion',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward),
                            ],
                          ),
                    ),

                  const SizedBox(height: 24),

                  const Text(
                    '¿Necesitas ayuda? Contacta con tu cordinador',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  final String etiqueta;
  final String textoAyuda;
  final IconData icono;
  final TextEditingController controlador;
  final bool ocultarTexto;
  final Widget? iconFinal;
  final TextInputType tipoTeclado;

  const CustomTextField({
    super.key,
    required this.etiqueta,
    required this.textoAyuda,
    required this.icono,
    required this.controlador,
    this.ocultarTexto = false,
    this.iconFinal,
    this.tipoTeclado = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(etiqueta),
        const SizedBox(height: 8),
        TextField(
          controller: controlador,
          obscureText: ocultarTexto,
          keyboardType: tipoTeclado,
          decoration: InputDecoration(
            hintText: textoAyuda,
            prefixIcon: Icon(icono),
            suffixIcon: iconFinal,
            filled: true,
            fillColor: const Color(0xFFF5F7FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
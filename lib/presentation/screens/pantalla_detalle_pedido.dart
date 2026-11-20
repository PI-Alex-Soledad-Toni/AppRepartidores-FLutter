
import 'package:flutter/material.dart';
import '../../data/models/pedido.dart';

class DetallePedidoScreen extends StatelessWidget {
  final Pedido pedido;

  const DetallePedidoScreen({super.key, required this.pedido});

  // Obtener el color según el estado del pedido.
  Color obtenerColorEstado(String estado) {
    switch (estado) {
      case 'ENTREGADO':
        return const Color(0xFF15803D);
      case 'EN RUTA':
        return const Color(0xFF2563EB);
      case 'PENDIENTE':
      case 'PREPARADO':
      case 'EN PREPARACION':
        return const Color(0xFFB45309);
      case 'NO ENTREGADO':
        return const Color(0xFFB91C1C);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color colorEstado = obtenerColorEstado(pedido.estado);

    // Formatear la fecha.
    final String fechaFormateada =
        '${pedido.fecha.day.toString().padLeft(2, '0')}/'
        '${pedido.fecha.month.toString().padLeft(2, '0')}/'
        '${pedido.fecha.year}';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF166534),
        foregroundColor: Colors.white,
        title: const Text(
          'Detalle del pedido',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Número del pedido.
          Text(
            'Pedido #${pedido.id}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF263746),
            ),
          ),

          const SizedBox(height: 16),

          // Estado del pedido.
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorEstado.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: colorEstado),
                const SizedBox(width: 10),
                Text(
                  pedido.estado,
                  style: TextStyle(
                    color: colorEstado,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Datos del destinatario.
          _SeccionDetalle(
            titulo: 'Datos del destinatario',
            icono: Icons.person_outline,
            contenido: [
              _DatoDetalle(
                titulo: 'Nombre',
                valor: pedido.destinatario,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Dirección de entrega.
          _SeccionDetalle(
            titulo: 'Dirección de entrega',
            icono: Icons.location_on_outlined,
            contenido: [
              _DatoDetalle(
                titulo: 'Dirección',
                valor: pedido.direccion,
              ),
              _DatoDetalle(
                titulo: 'Código postal',
                valor: pedido.codigoPostal,
              ),
              _DatoDetalle(
                titulo: 'Ciudad',
                valor: pedido.ciudad,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Información del pedido.
          _SeccionDetalle(
            titulo: 'Información del pedido',
            icono: Icons.receipt_long_outlined,
            contenido: [
              _DatoDetalle(
                titulo: 'Número de pedido',
                valor: pedido.id.toString(),
              ),
              _DatoDetalle(
                titulo: 'Fecha',
                valor: fechaFormateada,
              ),
            ],
          ),

          // Mostrar incidencia solamente si existe.
          if (pedido.incidencia != null) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Color(0xFFB91C1C),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Incidencia',
                        style: TextStyle(
                          color: Color(0xFFB91C1C),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    pedido.incidencia!,
                    style: const TextStyle(
                      color: Color(0xFF263746),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Widget para crear las secciones del detalle.
class _SeccionDetalle extends StatelessWidget {
  final String titulo;
  final IconData icono;
  final List<Widget> contenido;

  const _SeccionDetalle({
    required this.titulo,
    required this.icono,
    required this.contenido,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icono, color: const Color(0xFF166534)),
              const SizedBox(width: 8),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263746),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...contenido,
        ],
      ),
    );
  }
}

// Widget para mostrar cada dato.
class _DatoDetalle extends StatelessWidget {
  final String titulo;
  final String valor;

  const _DatoDetalle({
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF263746),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:apprepartidores_flutter/data/models/pedido.dart';
import 'package:flutter/material.dart';

class PedidoCard extends StatelessWidget {
  final Pedido pedido;
  final VoidCallback? onTap;
  const PedidoCard({super.key, required this.pedido, this.onTap});
  //TODO: Color según el estado del pedido
  Color obtenerColorEstado(String estado) {
    switch (estado) {
      case 'ENTREGADO':
        return const Color(0xFF15803D); //Verde
      case 'EN RUTA':
        return const Color(0xFF2563EB); //Azul
      case 'PENDIENTE':
      case 'PREPARADO':
      case 'EN PREPARACION':
        return const Color(0xFFB45309); //Naranja
      case 'NO ENTREGADO':
        return const Color(0xFFB91C1C); //Rojo
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorEstado = obtenerColorEstado(pedido.estado);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Número y estado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'pedido #${pedido.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF263746),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorEstado.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      pedido.estado,
                      style: TextStyle(
                        color: colorEstado,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Destinatario
              Row(
                children: [
                  const Icon(Icons.person_outline, color: Color(0xFF166534)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      pedido.destinatario,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Dirección
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xFF166534),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${pedido.direccion}, '
                      '${pedido.codigoPostal} ${pedido.ciudad}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ),
                ],
              ),

              // Incidencia, si existe
              if (pedido.incidencia != null) ...[
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Incidencia: ${pedido.incidencia}',
                    style: const TextStyle(
                      color: Color(0xFFB91C1C),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 12),

              const Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Ver detalles',
                      style: TextStyle(
                        color: Color(0xFF166534),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 13,
                      color: Color(0xFF166534),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

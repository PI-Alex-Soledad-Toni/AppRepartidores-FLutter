import 'package:apprepartidores_flutter/data/models/pedido.dart';
import 'package:apprepartidores_flutter/data/repositories/pedido_repository.dart';
import 'package:apprepartidores_flutter/presentation/widgets/pedido_card.dart';
import 'package:flutter/material.dart';

class PantallaPrincipal extends StatelessWidget {
  PantallaPrincipal({super.key});
  final PedidosRepository _repositorio = PedidosRepository();
  @override
  Widget build(BuildContext context) {
    final List<Pedido> pedidos = _repositorio.obtenerPedidos();
    final int totalPedidos = pedidos.length;
    final int pedidosEntregados = pedidos
        .where((p) => p.estado == 'ENTREGADO')
        .length;
    final int pedidosPendientes = totalPedidos - pedidosEntregados;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF166534),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'BatoiLOGIC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notificaciones',
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              '¡Hola repartidor',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263746),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Resumen de pedidos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263746),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _TarjetaResumen(
                    titulo: 'Total',
                    cantidad: totalPedidos,
                    icono: Icons.inventory_2_outlined,
                    color: const Color(0xFF166534),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _TarjetaResumen(
                    titulo: 'Pendientes',
                    cantidad: pedidosPendientes,
                    icono: Icons.pending_actions,
                    color: const Color(0xFFB45309),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _TarjetaResumen(
                    titulo: 'Entregados',
                    cantidad: pedidosEntregados,
                    icono: Icons.check_circle_outline,
                    color: const Color(0xFF15803D),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Mis pedidos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF263746),
              ),
            ),
            const SizedBox(height: 14),
            if (pedidos.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'No tienes pedidos asignados',
                    style: TextStyle(color: Color(0xFF64748B)),
                  ),
                ),
              )
            else
              ...pedidos.take(3).map((pedido) => PedidoCard(pedido: pedido)),
          ],
        ),
      ),
    );
  }
}

class _TarjetaResumen extends StatelessWidget {
  final String titulo;
  final int cantidad;
  final IconData icono;
  final Color color;

  const _TarjetaResumen({
    required this.titulo,
    required this.cantidad,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icono, color: color, size: 27),
          const SizedBox(height: 10),
          Text(
            cantidad.toString(),
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }
}

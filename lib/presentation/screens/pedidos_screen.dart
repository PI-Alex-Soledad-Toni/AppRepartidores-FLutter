
import 'package:flutter/material.dart';

import '../../data/models/pedido.dart';
import '../../data/repositories/pedido_repository.dart';
import '../widgets/pedido_card.dart';
import 'pantalla_detalle_pedido.dart';

class PedidosScreen extends StatefulWidget {
  const PedidosScreen({super.key});

  @override
  State<PedidosScreen> createState() => _PedidosScreenState();
}

class _PedidosScreenState extends State<PedidosScreen> {
  final PedidosRepository _repositorio = PedidosRepository();
  final TextEditingController _controladorBusqueda =
  TextEditingController();

  String _filtroSeleccionado = 'Todos';
  String _textoBusqueda = '';

  List<Pedido> _pedidos = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarPedidos();
  }
  Future<void> _cargarPedidos() async{
    try {
      final pedidos = await _repositorio.cargarPedidos();
      if (!mounted) return;
      setState(() {
        _pedidos = pedidos;
        _cargando = false;
      });
    }catch(e){
      if (!mounted) return;

      setState(() {
        _cargando = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar los pedidos: $e'),),
      );
    }
  }

  @override
  void dispose() {
    _controladorBusqueda.dispose();
    super.dispose();
  }

  // Filtrar pedidos por búsqueda y estado.
  List<Pedido> get _pedidosFiltrados {
    return _pedidos.where((pedido) {
      final busqueda = _textoBusqueda.toLowerCase();

      final coincideBusqueda =
          pedido.destinatario.toLowerCase().contains(busqueda) ||
              pedido.id.toString().contains(busqueda);

      bool coincideFiltro = true;

      switch (_filtroSeleccionado) {
        case 'Pendientes':
          coincideFiltro =
              pedido.estado == 'PENDIENTE' ||
                  pedido.estado == 'PREPARADO' ||
                  pedido.estado == 'EN PREPARACION';
          break;

        case 'En ruta':
          coincideFiltro = pedido.estado == 'EN RUTA';
          break;

        case 'Entregados':
          coincideFiltro = pedido.estado == 'ENTREGADO';
          break;

        case 'No entregados':
          coincideFiltro = pedido.estado == 'NO ENTREGADO';
          break;
      }

      return coincideBusqueda && coincideFiltro;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final pedidosMostrados = _pedidosFiltrados;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF166534),
        foregroundColor: Colors.white,
        title: const Text(
          'Mis pedidos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Buscador
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controladorBusqueda,
              onChanged: (valor) {
                setState(() {
                  _textoBusqueda = valor;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar por destinatario o ID...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _textoBusqueda.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _controladorBusqueda.clear();
                    setState(() {
                      _textoBusqueda = '';
                    });
                  },
                )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Filtros de estado
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _crearFiltro('Todos'),
                const SizedBox(width: 8),
                _crearFiltro('Pendientes'),
                const SizedBox(width: 8),
                _crearFiltro('En ruta'),
                const SizedBox(width: 8),
                _crearFiltro('Entregados'),
                const SizedBox(width: 8),
                _crearFiltro('No entregados'),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Lista de pedidos
          Expanded(
            child: _cargando
                ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF166534),
              ),
            )
                : pedidosMostrados.isEmpty
                ? const Center(
              child: Text(
                'No se han encontrado pedidos',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 16,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: pedidosMostrados.length,
              itemBuilder: (context, indice) {
                final pedido = pedidosMostrados[indice];

                return PedidoCard(
                  pedido: pedido,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetallePedidoScreen(pedido: pedido),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Crear cada botón de filtro.
  Widget _crearFiltro(String nombre) {
    final seleccionado = _filtroSeleccionado == nombre;

    return ChoiceChip(
      label: Text(nombre),
      selected: seleccionado,
      selectedColor: const Color(0xFF166534),
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: seleccionado
            ? Colors.white
            : const Color(0xFF263746),
        fontWeight: FontWeight.w600,
      ),
      onSelected: (seleccionado) {
        setState(() {
          _filtroSeleccionado = nombre;
        });
      },
    );
  }
}


import '../models/pedido.dart';

class PedidosRepository {
  // Datos simulados para probar la aplicación.
  static final List<Pedido> _pedidos = [
    Pedido(
      id: 1001,
      destinatario: 'Juan Martinez',
      direccion: 'Avenida Pais Valencià, 25',
      codigoPostal: '03802',
      ciudad: 'Alcoy',
      estado: 'EN RUTA',
      fecha: DateTime.now(),
    ),
    Pedido(
      id: 1002,
      destinatario: 'Maria Garcia',
      direccion: 'Calle Mayor 12',
      codigoPostal: '03801',
      ciudad: 'Alcoy',
      estado: 'PENDIENTE',
      fecha: DateTime.now(),
    ),
    Pedido(
      id: 1003,
      destinatario: 'Laura Perez',
      direccion: 'Calle San Nicolás, 8',
      codigoPostal: '03803',
      ciudad: 'Alcoy',
      estado: 'ENTREGADO',
      fecha: DateTime.now(),
    ),
    Pedido(
      id: 1004,
      destinatario: 'Carlos López',
      direccion: 'Calle Santa Rosa, 41',
      codigoPostal: '03804',
      ciudad: 'Alcoy',
      estado: 'PREPARADO',
      fecha: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Pedido(
      id: 1005,
      destinatario: 'Ana Fernández',
      direccion: 'Calle Oliver, 16',
      codigoPostal: '03805',
      ciudad: 'Alcoy',
      estado: 'NO ENTREGADO',
      incidencia: 'Cliente ausente',
      fecha: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  List<Pedido> obtenerPedidos() {
    return _pedidos;
  }
}

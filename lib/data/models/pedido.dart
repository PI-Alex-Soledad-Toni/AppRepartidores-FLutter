
class Pedido {
  final int id;
  final String destinatario;
  final String direccion;
  final String codigoPostal;
  final String ciudad;
  final String estado;
  final String? incidencia;
  final DateTime fecha;

  const Pedido({
    required this.id,
    required this.destinatario,
    required this.direccion,
    required this.codigoPostal,
    required this.ciudad,
    required this.estado,
    required this.fecha,
    this.incidencia,
  });
factory Pedido.fromJson(Map<String, dynamic> json) {
  return Pedido(
    id: json['id'],
    destinatario: json['destinatario'],
    direccion: json['direccion'],
    codigoPostal: json['codigoPostal'],
    ciudad: json['ciudad'],
    estado: json['estado'],
    incidencia: json['incidencia'],
    fecha: DateTime.parse(json['fecha']),
  );
}
}


class Repartidor {
  final int id;
  final String nombre;
  final String apellidos;
  final String usuario;

  const Repartidor({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.usuario,
  });

  String get nombreCompleto => '$nombre $apellidos';
}

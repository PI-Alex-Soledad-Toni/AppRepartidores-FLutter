import '../models/comanda.dart';
class ComandaRepository {
  //TODO: Datos simulados para probar
  static const List<Comanda> _comandas=[
    Comanda(id: 101,
        destinatario: "Maria Garcia",
        direccion: "Calle Mayor 12",
        codigoPostal: "03801",
        ciudad: "ciudad",
        estado: "estado")
  ];
}
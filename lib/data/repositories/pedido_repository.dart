
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/pedido.dart';

class PedidosRepository {
  // Lista donde guardaremos los pedidos obtenidos del JSON.
  List<Pedido> _pedidos = [];

  // Cargar el JSON y convertir sus datos en objetos Pedido.
  Future<List<Pedido>> cargarPedidos() async {
    final String contenido =
    await rootBundle.loadString('assets/json/pedidos.json');

    final Map<String, dynamic> json =
    jsonDecode(contenido);

    final List<dynamic> listaJson = json['pedidos'];

    _pedidos = listaJson.map((pedidoJson) {
      return Pedido.fromJson(pedidoJson);
    }).toList();

    return _pedidos;
  }

  // Obtener los pedidos ya cargados.
  List<Pedido> obtenerPedidos() {
    return _pedidos;
  }
}

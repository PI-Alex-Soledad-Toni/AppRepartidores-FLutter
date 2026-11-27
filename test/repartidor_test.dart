import 'package:flutter_test/flutter_test.dart';
import 'package:apprepartidores_flutter/data/models/repartidor.dart';

void main() {
  test('Debe devolver el nombre completo del repartidor', () {
    const repartidor = Repartidor(
      id: 1,
      nombre: 'Carlos',
      apellidos: 'Martínez',
      usuario: 'cmartinez',
    );

    expect(repartidor.nombreCompleto, 'Carlos Martínez');
  });
}
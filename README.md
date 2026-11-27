# BatoiLOGIC – App de repartidores

## Descripción

Aplicación móvil desarrollada con **Flutter y Dart** para el Proyecto Intermodular de 2.º DAM.

Su objetivo es facilitar a los repartidores de BatoiLOGIC el acceso y la consulta de los pedidos que tienen asignados.

Este ejercicio corresponde a la primera evaluación del módulo de PMDM.

## Objetivos

- Crear una arquitectura que separe la interfaz, la lógica y el acceso a los datos.
- Implementar una pantalla de login con validación estática del repartidor.
- Desarrollar una primera versión de la pantalla principal y del listado de pedidos.
- Gestionar el ciclo de vida de los widgets.
- Realizar pruebas de ejecución en un emulador Android (AVD).

## Tecnologías

- Flutter y Dart.
- Android Studio.
- JSON para almacenar los datos de prueba.
- Git para el control de versiones.

## Estructura del proyecto

```text
lib/
├── data/
│   ├── models/
│   │   ├── pedido.dart
│   │   └── repartidor.dart
│   └── repositories/
│       └── pedido_repository.dart
│
├── domain/
│   └── services/
│       └── servicio_autenticacion.dart
│
├── presentation/
│   ├── screens/
│   │   ├── pantalla_login.dart
│   │   ├── pantalla_principal.dart
│   │   ├── pedidos_screen.dart
│   │   └── pantalla_detalle_pedido.dart
│   └── widgets/
│       ├── campo_texto_personalizado.dart
│       └── pedido_card.dart
│
└── main.dart

assets/
├── imagenes/
│   └── logo_batoilogic.png
└── json/
    └── pedidos.json

test/
└── repartidor_test.dart
```

## Funcionalidades desarrolladas

- **Login:** pantalla de identificación del repartidor con validación local.
- **Pantalla principal:** resumen y visualización de los pedidos del día.
- **Listado de pedidos:** consulta de pedidos, búsqueda por destinatario o identificador y filtros por estado.
- **Detalle del pedido:** visualización de la información de cada pedido.
- **Carga de datos:** lectura de pedidos desde un archivo JSON local mediante un repositorio.

La aplicación utiliza `async/await` para la carga de datos y `StatefulWidget` para gestionar los cambios de estado de las pantallas.

## Ejecución del proyecto

Clonar el repositorio:

```bash
git clone URL_DEL_REPOSITORIO
```

Acceder a la carpeta del proyecto:

```bash
cd AppRepartidores-FLutter
```

Instalar las dependencias:

```bash
flutter pub get
```

Ejecutar la aplicación:

```bash
flutter run
```

## Alcance

Esta primera versión se centra en la arquitectura inicial, el login y la consulta de pedidos mediante datos locales.

La conexión con la API REST, la persistencia mediante SQLite, la actualización de estados en el servidor y la geolocalización se desarrollarán en las siguientes fases del proyecto.
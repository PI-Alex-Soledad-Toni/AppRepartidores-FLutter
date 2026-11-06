class Authservice {
  static bool login(String usuario, String contrasena){
    const usuarioCorrecto = 'repartidor';
    const contrasenaCorrecta = '123456';

    return usuario == usuarioCorrecto && contrasena == contrasenaCorrecta;
  }
}
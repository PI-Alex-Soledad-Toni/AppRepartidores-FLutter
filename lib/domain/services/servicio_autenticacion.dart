class ServicioAutenticacion {
  static bool iniciarSesion(String usuario, String contrasena){
    const usuarioCorrecto = 'repartidor@mail.com';
    const contrasenaCorrecta = '@Password1';

    return usuario == usuarioCorrecto && contrasena == contrasenaCorrecta;
  }
}
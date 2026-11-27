import 'package:flutter/material.dart';
import '../../domain/services/servicio_autenticacion.dart';
import 'pantalla_principal.dart';

class PantallaLogin extends StatefulWidget{
  const PantallaLogin({Key? key}) : super(key: key);

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin>{

    final _formKey = GlobalKey<FormState>();

    String _usuario = '';
    String _contrasenya = '';

    @override
    Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _eMailInput(),
              _passwordInput(),
              _loginButton(),
            ],
          )
        ),
      );
    }

    Widget _eMailInput(){
      return Container(
        margin: EdgeInsets.all(20.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Usuario',
            hintText: 'Escribe tu mail',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
            )
          ),
          validator: (value){
            if (value == null || value.isEmpty) {
              return 'User cannot be empty';
            }

            if (!value.contains('@')) {
              return 'User must contain @';
            }

            return null;
          },
          onSaved: (value){
            _usuario = value!;
          },
        ),
      );
    }

    Widget _passwordInput(){
      return Container(
        margin: EdgeInsets.all(20.0),
        child: TextFormField(
          obscureText: true,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintText: 'Escribe la contraseña',
            labelText: 'Contraseña',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          ),
          validator: (value){
            if(value == null || value.isEmpty){
              return 'Sorry, password can not be empty';
            }

            if (value.length < 8) {
              return 'Password must contain at least 8 characters';
            }

            if (!RegExp(r'[A-Z]').hasMatch(value)) {
              return 'Password must contain an uppercase letter';
            }

            if (!RegExp(r'[0-9]').hasMatch(value)) {
              return 'Password must contain a number';
            }

            if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=]').hasMatch(value)) {
              return 'Password must contain a symbol';
            }

            return null;
          },
          onSaved: (value){
            _contrasenya = value!;
          },
        ),
      );
    }

    Widget _loginButton(){
      return Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          child: const Text('Iniciar Sesión'),
          onPressed: () {
            if(_formKey.currentState!.validate()){
              _formKey.currentState!.save();
              if(ServicioAutenticacion.iniciarSesion(_usuario, _contrasenya)){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bienvenido')));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PantallaPrincipal()));
              }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuario o contraseña incorrecta')) );
            }
            }
          }
        ),
      );
    }

  }
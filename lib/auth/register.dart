import 'package:flutter/material.dart';
import 'package:project/auth/login.dart';
import 'package:project/pages/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 50.0,
        ),
        children: <Widget>[
          Center(
              child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.indigoAccent,
                  backgroundImage: AssetImage('images/food-1.jpg'))),
          Text('Register',
              style: TextStyle(fontFamily: 'cursive', fontSize: 50.0)),
          SizedBox(
              width: 160.0,
              height: 15.0,
              child: Divider(color: Colors.blueGrey[600])),
          TextField(
            controller: _usernameController,
            enableInteractiveSelection: false,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                hintText: 'Username',
                labelText: 'Username',
                suffixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((20.0)))),
          ),
          SizedBox(height: 25.0),
          TextField(
            controller: _emailController,
            enableInteractiveSelection: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Correo',
                labelText: 'Correo',
                suffixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((20.0)))),
          ),
          SizedBox(height: 25.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            enableInteractiveSelection: false,
            decoration: InputDecoration(
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                suffixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((20.0)))),
          ),
          SizedBox(height: 25.0),
          TextField(
            controller: _passwordController,
            obscureText: true,
            enableInteractiveSelection: false,
            decoration: InputDecoration(
                hintText: 'Confirmar contraseña',
                labelText: 'Confirmar contraseña',
                suffixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular((20.0)))),
          ),
          SizedBox(height: 25.0),
          ElevatedButton(
            onPressed: () {
              String username = _usernameController.text;
              String email = _emailController.text;
              String password = _passwordController.text;

              // Aquí puedes implementar la lógica de registro de usuarios
              // Guardar los datos en una base de datos, realizar validaciones, etc.

              // Ejemplo de navegación a la pantalla de inicio después del registro
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homePages()),
              );
            },
            child: Text('Register'),
          ),
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
            child: Text(
              '¿Ya tienes cuenta? Ingresa aqui',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

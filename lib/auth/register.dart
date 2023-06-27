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
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 50.0,
          ),
          children: <Widget>[
            Center(
                child: CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Color(0xFFFFA07A),
                    backgroundImage: AssetImage('../images/principal.jpg'))),
            Text('Register',
                style: TextStyle(fontFamily: 'cursive', fontSize: 50.0)),
            SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Color(0xFFFFA07A))),
                
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
            Theme(
            data: ThemeData(
              primaryColor: Color(0xFFFFA07A),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Color(0xFFFFA07A),
              ),
            ),
            child: TextField(
              enableInteractiveSelection: false,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                hintText: 'E-mail',
                labelText: 'E-mail',
                suffixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  
                ),
              ),
            ),
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
              style: ElevatedButton.styleFrom(
                primary:
                    Color(0xFFFFA07A), // Establece el color de fondo del botón
              ),
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
                  color: Colors.black, // Establece el color en negro
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

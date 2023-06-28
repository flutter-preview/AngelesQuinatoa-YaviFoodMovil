import 'package:flutter/material.dart';
import 'package:project/auth/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Color.fromARGB(255, 239, 152, 71),
                    backgroundImage: AssetImage('images/principal.jpg'),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'YaviFood',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lobster',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
const SizedBox(height: 16.0),
                Theme(
                  data: ThemeData(
                    primaryColor: Color(0xFFFFA07A),
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      primary: Color(0xFFFFA07A),
                    ),
                  ),
                  child: TextField(
                    enableInteractiveSelection: false,
                    obscureText: !isPasswordVisible,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'PassWord',
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Theme(
                  data: ThemeData(
                    primaryColor: Color(0xFFFFA07A),
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      primary: Color(0xFFFFA07A),
                    ),
                  ),
                  child: TextField(
                    enableInteractiveSelection: false,
                    obscureText: !isPasswordVisible,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                                const SizedBox(height: 16.0),
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
                      hintText: 'Direccion',
                      labelText: 'Direccion',
                      suffixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFA07A),
                  ),
                  child: Text('Register'),
                ),
                const SizedBox(height: 16.0),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()),
                      );
                    },
                    child: Text(
                      '¿Ya tienes una cuenta? Inicia sesión',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

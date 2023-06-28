import 'package:flutter/material.dart';
import 'package:project/auth/register.dart';
import 'package:project/pages/home.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool rememberPassword = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
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
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CheckboxListTile(
                  title: Align(
                    child: Text(
                      'Recordar contraseña',
                      style: TextStyle(
                        color: rememberPassword ? Color(0xFFFFA07A) : Colors.black,
                      ),
                    ),
                  ),
                  value: rememberPassword,
                  onChanged: (value) {
                    setState(() {
                      rememberPassword = value!;
                    });
                  },
                  activeColor: Color(0xFFFFA07A),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homePages()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFA07A),
                  ),
                  child: Text('Login'),
                ),
                const SizedBox(height: 16.0),
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      '¿No tienes cuenta? Regístrate',
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

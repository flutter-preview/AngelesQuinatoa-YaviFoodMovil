import 'package:flutter/material.dart';
import 'package:project/auth/login.dart';

class homePages extends StatefulWidget {
  const homePages({super.key});

  @override
  State<homePages> createState() => _homeState();
}

class _homeState extends State<homePages> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
         selectedItemColor: Color(0xFFFFA07A), // Cambio de color cuando está seleccionado
      unselectedItemColor: Colors.black,
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Producto 1', price: '\$10', image: '../images/food-1.jpg'),
    Product(name: 'Producto 2', price: '15.00', image: '../images/food-2.jpg'),
    Product(name: 'Producto 3', price: '12.50', image: '../images/food-3.jpg'),
    Product(name: 'Producto 4', price: '120.50', image: '../images/food-4.jpg'),
    Product(name: 'Producto 5', price: '1.50', image: '../images/food-5.jpg'),
    Product(name: 'Producto 6', price: '13.50', image: '../images/food-6.jpg'), 
    // Agrega las demás entradas de productos con sus respectivas imágenes
  ];
@override
Widget build(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Yavi',
              style: TextStyle(
                color: Colors.black, // Cambio del color del texto a negro
                fontFamily: 'Lobster',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Food',
              style: TextStyle(
                color: Color.fromARGB(255, 232, 153, 88), // Cambio del color del texto a plomo más oscuro
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.5),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Busca tu platillo',
                        border: InputBorder.none,
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 232, 153, 88),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Text(
            //   'Tarea 6 Jinson Medina',
            //   style: TextStyle(
            //     fontSize: 24.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(height: 20.0),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 30.0,
              children: products.map((product) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10.0),
                          ),
                          child: Image.asset(
                            product.image,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        margin: EdgeInsets.only(left: 6.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Platillos',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Color.fromARGB(255, 232, 153, 88),
                          ),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 10.0),
                                Icon(Icons.star, color: Colors.orange, size: 10.0),
                                Icon(Icons.star, color: Colors.orange, size: 10.0),
                                Icon(Icons.star, color: Colors.orange, size: 10.0),
                                Icon(Icons.star, color: Colors.orange, size: 10.0),
                              ],
                            ),
                            SizedBox(width: 4.0),
                            Icon(Icons.favorite, color: Colors.red, size: 15.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.0, right: 6.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica para el botón de compra
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(10, 15),
                              primary: Colors.grey[300],
                            ),
                            child: Text(
                              'Quito',
                              style: TextStyle(fontSize: 7.0, color: Colors.grey[700]),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6.0),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Text(
                            ' \$20',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ),
  );
}
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Búsqueda'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(255, 0, 255, 225),
                Color.fromARGB(0, 180, 177, 3)
              ],
              begin: Alignment.bottomRight,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 300.5),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                  hintText: 'Buscar',
                  labelText: 'Búsqueda',
                  helperText: 'Ingrese su consulta',
                ),
                autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Nombre: Jinson',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Apellidos: Medina',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'CI: 1234567',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Correo: jinson@medina.com',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButtonWithIcon(
                  icon: Icons.edit,
                  label: 'Editar',
                  onPressed: () {},
                ),
                RoundedButtonWithIcon(
                  icon: Icons.lock,
                  label: 'Settings',
                  onPressed: () {},
                ),
                RoundedButtonWithIcon(
                  icon: Icons.join_left,
                  label: 'Salir',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const RoundedButtonWithIcon({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

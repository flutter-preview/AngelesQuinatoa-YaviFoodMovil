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
    Screen4(),
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
        selectedItemColor:
            Color(0xFFFFA07A), // Cambio de color cuando está seleccionado
        unselectedItemColor: Colors.black,
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Producto 1', price: '\$10', image: 'images/food-1.jpg'),
    Product(name: 'Producto 2', price: '15.00', image: 'images/food-2.jpg'),
    Product(name: 'Producto 3', price: '12.50', image: 'images/food-3.jpg'),
    Product(name: 'Producto 4', price: '120.50', image: 'images/food-4.jpg'),
    Product(name: 'Producto 5', price: '1.50', image: 'images/food-5.jpg'),
    Product(name: 'Producto 6', price: '13.50', image: 'images/food-6.jpg'),
    // Agrega las demás entradas de productos con sus respectivas imágenes
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    color: Color.fromARGB(255, 232, 153,
                        88), // Cambio del color del texto a plomo más oscuro
                    fontFamily: 'Lobster',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.5),
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
                crossAxisCount: 1,
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
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 10.0),
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 10.0),
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 10.0),
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 10.0),
                                  Icon(Icons.star,
                                      color: Colors.orange, size: 10.0),
                                ],
                              ),
                              SizedBox(width: 4.0),
                              Icon(Icons.favorite,
                                  color: Colors.red, size: 15.0),
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
                                style: TextStyle(
                                    fontSize: 7.0, color: Colors.grey[700]),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 6.0),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              ' \$20',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Color.fromARGB(255, 232, 153, 88),
                          ),
                          child: Text('Ver Platillo'),
                          onPressed: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context)=> Screen4()),
                            );
                          },
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

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  late TextEditingController _controller;
  int valor = 1;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: valor.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void increment() {
    setState(() {
      if (valor < 5) {
        valor++;
        _controller.text = valor.toString();
      }
    });
  }

  void decrement() {
    setState(() {
      if (valor > 1) {
        valor--;
        _controller.text = valor.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Yavi',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lobster',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Food',
                  style: TextStyle(
                    color: Color.fromARGB(255, 232, 153, 88),
                    fontFamily: 'Lobster',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(70.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 232, 153, 88),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/food-1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Sopa',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: decrement,
                                  ),
                                  SizedBox(width: 4.0),
                                  Container(
                                    width: 40.0,
                                    child: TextField(
                                      controller: _controller,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        setState(() {
                                          valor = int.tryParse(value) ?? 1;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.0),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: increment,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Precio: \$99.99',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.0),
                              ElevatedButton(
                                onPressed: () {
                                  // Acción para eliminar el producto
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  minimumSize: Size(120.0, 40.0),
                                ),
                                child: Text(
                                  'Eliminar',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 232, 153, 88),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Count: 2',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Price: \$99.99',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Acción para pasar por la caja
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 232, 153, 88),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          minimumSize: Size(140.0, 20.0),
                        ),
                        child: Text(
                          'Pagar',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
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





class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Yavi',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Food',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 153, 88),
                  fontFamily: 'Lobster',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Card(
            margin: EdgeInsets.all(40.0),
            shadowColor: Colors.grey,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('../images/perfil.jpeg'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                      elevation: 2.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                    ),
                    child: Text(
                      'Nombre: Estela Micaela',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                      elevation: 2.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                    ),
                    child: Text(
                      'Apellidos: Roldos Montes',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                      elevation: 2.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                    ),
                    child: Text(
                      'CI: 1234567987-6',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                      elevation: 2.0,
                      shadowColor: Colors.grey.withOpacity(0.5),
                    ),
                    child: Text(
                      'Correo: estelaroldos2@gmail.com',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        icon: Icon(Icons.edit),
                        label: Text(
                          'Editar',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        icon: Icon(Icons.settings),
                        label: Text(
                          'Configuración',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        icon: Icon(Icons.logout),
                        label: Text(
                          'Salir',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class Screen4 extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem(
      image: 'images/food-1.jpg',
      description: 'Pizza Margherita',
      price: '12.99',
    ),
    FoodItem(
      image: 'images/food-2.jpg',
      description: 'Hamburguesa clásica',
      price: '8.99',
    ),
    // Agrega más elementos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Yavi',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lobster',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Food',
                style: TextStyle(
                  color: Color.fromARGB(255, 232, 153, 88),
                  fontFamily: 'Lobster',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white, 
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/product1.jpg'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Me alegra tenerte aquí',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.black),
                title: Text(
                  'Inicio',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  // Lógica para manejar la selección del menú de Inicio
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart, color: Colors.black),
                title: Text(
                  'Carrito',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  // Lógica para manejar la selección del menú de Carrito
                },
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.black),
                title: Text(
                  'Perfil',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  // Lógica para manejar la selección del menú de Perfil
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.black),
                title: Text(
                  'Salir',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  // Lógica para manejar la selección del menú de Salir
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return Center(
              child: Card(
                margin: EdgeInsets.all(40.0),
                shadowColor: Colors.grey,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage(foodItems[index].image),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        foodItems[index].description,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '\$${foodItems[index].price}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Agregar lógica para agregar al carrito
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'Agregar al carrito',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FoodItem {
  final String image;
  final String description;
  final String price;

  FoodItem({
    required this.image,
    required this.description,
    required this.price,
  });
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
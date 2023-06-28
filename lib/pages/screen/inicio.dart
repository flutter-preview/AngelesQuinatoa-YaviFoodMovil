import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FoodApi {
  static const String baseUrl = 'http://localhost:5000/api/foods';

  static Future<List<dynamic>> getFoods() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch foods');
    }
  }

  static Future<List<dynamic>> searchFoods(String searchTerm) async {
    final response = await http.get(Uri.parse('$baseUrl/search/$searchTerm'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to search foods');
    }
  }

  static Future<List<dynamic>> getTags() async {
    final response = await http.get(Uri.parse('$baseUrl/tags'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch tags');
    }
  }

  static Future<List<dynamic>> getFoodsByTag(String tagName) async {
    final response = await http.get(Uri.parse('$baseUrl/tag/$tagName'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch foods by tag');
    }
  }

  static Future<dynamic> getFoodById(String foodId) async {
    final response = await http.get(Uri.parse('$baseUrl/$foodId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch food by ID');
    }
  }

  static Future<dynamic> createFood(Map<String, dynamic> newFood) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newFood),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create food');
    }
  }

  static Future<dynamic> updateFood(String foodId, Map<String, dynamic> updatedFood) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$foodId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updatedFood),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update food');
    }
  }

  static Future<void> deleteFood(String foodId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$foodId'));
    if (response.statusCode == 200) {
      print('Food deleted successfully');
    } else {
      throw Exception('Failed to delete food');
    }
  }
}

// Ejemplo de uso en una pantalla de Flutter

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: FoodApi.getFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> foods = snapshot.data!;
            return ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return ListTile(
                  title: Text(food['name']),
                  subtitle: Text(food['description']),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

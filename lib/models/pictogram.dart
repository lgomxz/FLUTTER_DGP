import 'dart:convert';
import 'package:http/http.dart' as http;

class Pictogram {
  final int id;
  final String name;
  final String category;

  final String img;
  final double price;


  static String _baseAddress = 'api.arasaac.org';
  static String _applicationName = 'api/pictograms';
  static String _language = 'es';

  Pictogram({
    required this.id,
    required this.name,
    required this.category,
    required this.img,
    required this.price,
  });

  factory Pictogram.fromJSON(Map<String, dynamic> json) =>
      Pictogram(
          id: json['id'],
          name: json['nombre'],
          category: json['categories_id'],
          img: json['imagen'],
          price: json['precio']
      );

  Map<String, dynamic> toJSON() =>
      {
        'id': id,
        'nombre': name,
        'categories_id': category,
        'imagen': img,
        'precio': price,
      };

/*
  static Future<List<Product>> getProducts() async {
    final response = await http.get(
        Uri.https(_baseAddress, _applicationName+'/products'),
    );
    var jsonData = jsonDecode(response.body);
    List <Product> products = [];

    for(var p in jsonData){
      Product product = Product(id: p['id'], name: p['nombre'], category_id: p['categories_id'], price: p['precio']);
      products.add(product);
    }

    if (response.statusCode == 200)
      return products;
    else throw Exception('Failed to get products');
  }
*/
  static Future<List<Pictogram>> getProducts() async {
    final response = await http.get(
      Uri.https(_baseAddress, _applicationName + '/products'),
    );
    var json = jsonDecode(response.body);
    final List <Pictogram> allProducts = [];

    for (var p in json) {
      Pictogram picto = Pictogram(
          id: p['id'],
          name: p['nombre'],
          img: p['imagen'],
          category: p['categories_id'],
          price: p['precio']);
      allProducts.add(picto);
      print(allProducts.length);
    }
    if (response.statusCode == 200)
      return allProducts;
    else
      throw Exception('Failed to get pictogram');
  }
}
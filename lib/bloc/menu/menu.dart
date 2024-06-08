import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MenuItem {
  final String id;
  final String nama;
  final int harga;
  final String jenis;
  final double rate;
  int value;
  double hargaAkhir;

  MenuItem({
    required this.id,
    required this.nama,
    required this.harga,
    required this.jenis,
    required this.rate,
    required this.value,
    required this.hargaAkhir,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'], // Pastikan atribut 'id' ada dalam data JSON
      nama: json['nama'],
      harga: json['harga'],
      jenis: json['jenis'],
      rate: json['rate'].toDouble(),
      value: json['value'],
      hargaAkhir: json['harga_akhir'],
    );
  }

  void incrementValue() {
    value += 1;
  }
  
}

Future<List<MenuItem>> fetchMenuItems() async {
  final response = await http.get(Uri.parse(
      'https://pemesananmakanan-67326-default-rtdb.firebaseio.com/menu_makanan.json'));

  if (response.statusCode == 200) {
    List<MenuItem> menuItems = [];
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((key, value) {
      menuItems.add(MenuItem.fromJson({
        'id': key,
        ...value,
      }));
    });
    return menuItems;
  } else {
    throw Exception('Failed to load menu items');
  }
}

Future<void> updateMenuItemValue(
    String itemId, int currentValue, int harga, double hargaAkhir) async {
  final url = Uri.parse(
      'https://pemesananmakanan-67326-default-rtdb.firebaseio.com/menu_makanan/$itemId.json');
  final response = await http.patch(
    url,
    body: jsonEncode({
      'value': currentValue + 1,
      'harga_akhir': (currentValue + 1) * harga, // Menghitung harga_akhir
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update menu item value');
  }
}

Future<void> plushMenuItemValue(
    String itemId, int currentValue, int harga, double hargaAkhir) async {
  final url = Uri.parse(
      'https://pemesananmakanan-67326-default-rtdb.firebaseio.com/menu_makanan/$itemId.json');
  final response = await http.patch(
    url,
    body: jsonEncode({
      'value': currentValue + 1,
      'harga_akhir': (currentValue + 1) * harga, // Menghitung harga_akhir
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update menu item value');
  }
}

Future<void> minMenuItemValue(
    String itemId, int currentValue, int harga, double hargaAkhir) async {
  final url = Uri.parse(
      'https://pemesananmakanan-67326-default-rtdb.firebaseio.com/menu_makanan/$itemId.json');
  final response = await http.patch(
    url,
    body: jsonEncode({
      'value': currentValue - 1,
      'harga_akhir': (currentValue - 1) * harga, // Menghitung harga_akhir
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update menu item value');
  }
}
Future<void> defaultMenuItemValue(
    String itemId, int currentValue, int harga, double hargaAkhir) async {
  final url = Uri.parse(
      'https://pemesananmakanan-67326-default-rtdb.firebaseio.com/menu_makanan/$itemId.json');
  final response = await http.patch(
    url,
    body: jsonEncode({
      'value': 0,
      'harga_akhir': 0, // Menghitung harga_akhir
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to update menu item value');
  }
}



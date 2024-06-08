import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/ui/home_screen.dart';
import 'package:pemesanan_makanan/ui/login.dart';
import 'package:pemesanan_makanan/ui/foodList_screen.dart';
import 'package:pemesanan_makanan/ui/keranjang_screen.dart';
import 'package:pemesanan_makanan/ui/profile.dart';
import 'package:pemesanan_makanan/ui/riwayat_screen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);
  
  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          KeranjangScreen(), // Replace with CartScreen() when created
          RiwayatScreen(), // Replace with FoodListScreen() when created
          ProfileScreen(), // Replace with ProfileScreen() when created
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(253, 65, 2, 1),
        unselectedItemColor: Color(0xff555555),
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'dart:async';

class FoodListCompleteScreen extends StatefulWidget {
  const FoodListCompleteScreen({Key? key}) : super(key: key);

  @override
  State<FoodListCompleteScreen> createState() => _FoodListCompleteScreenState();
}

class _FoodListCompleteScreenState extends State<FoodListCompleteScreen> {
  int _remainingTime = 60; // Waktu hitungan mundur dalam detik
  late Timer _timer; // Timer untuk menghitung mundur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => NavigatorScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: Text('Detail Pesanan'),
        backgroundColor: Color.fromRGBO(253, 65, 2, 1),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daftar Pemesanan',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Nasi Goreng Kambing'),
                            Text('Rp 18.000'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Air Mineral'),
                            Text('Rp 5.000'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10), // Adds padding around the Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text('Rp 23.000'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10), // Adds padding around the Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status'),
                        Text(
                          'Complete',
                          style: TextStyle(
                            color: Color(0xFF0FB816),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

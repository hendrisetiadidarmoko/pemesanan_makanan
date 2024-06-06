import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'dart:async';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int quantity = 1;
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
        title: Text('Menu Utama'),
        backgroundColor: Color.fromRGBO(253, 65, 2, 1),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nasi Goreng Telur',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Text(
                                'Rp 10.000',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          iconSize: 15,
                          onPressed: () {
                            // Tambahkan fungsi yang ingin Anda jalankan saat tombol ditekan di sini
                          },
                          constraints: BoxConstraints.tightFor(
                            width: 20,
                            height: 20,
                          ),
                          padding: EdgeInsets.zero,
                          splashRadius: 15,
                          alignment: Alignment.center,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(253, 65, 2, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nasi Goreng Telur',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Text(
                                'Rp 10.000',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.white,
                          iconSize: 15,
                          onPressed: () {
                            // Tambahkan fungsi yang ingin Anda jalankan saat tombol ditekan di sini
                          },
                          constraints: BoxConstraints.tightFor(
                            width: 20,
                            height: 20,
                          ),
                          padding: EdgeInsets.zero,
                          splashRadius: 15,
                          alignment: Alignment.center,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(253, 65, 2, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

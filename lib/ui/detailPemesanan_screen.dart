import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'dart:async';

class DetailPemesananScreen extends StatefulWidget {
  const DetailPemesananScreen({Key? key}) : super(key: key);

  @override
  State<DetailPemesananScreen> createState() => _DetailPemesananScreenState();
}

class _DetailPemesananScreenState extends State<DetailPemesananScreen> {
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
        title: Text('Detail Pemesanan'),
        backgroundColor: Color.fromRGBO(253, 65, 2, 1),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Informasi Pemesanan',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nomer Pemesanan'),
                                  Text('7384184218'),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Waktu Pemesanan'),
                                  Text('10 Mei 2024 | 08.00'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nasi Goreng Kambing'),
                                  Text('Rp 18.000'),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          padding:
                              EdgeInsets.all(10), // Adds padding around the Row
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

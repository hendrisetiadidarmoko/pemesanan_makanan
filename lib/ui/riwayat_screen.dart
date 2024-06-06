import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'package:pemesanan_makanan/ui/detailPemesanan_screen.dart';
import 'dart:async';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({Key? key}) : super(key: key);

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
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
        title: Text('Riwayat'),
        backgroundColor: Color.fromRGBO(253, 65, 2, 1),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPemesananScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2 Menu',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '19 Agustus 2024',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          // Add your other widgets here
                        ],
                      ),
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

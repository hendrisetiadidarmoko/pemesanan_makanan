import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/ui/foodList_screen.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'dart:async';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({Key? key}) : super(key: key);

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  int quantity1 = 1;
  int quantity2 = 1;

  void tambahJumlah(int item) {
    setState(() {
      if (item == 1) {
        quantity1++;
      } else if (item == 2) {
        quantity2++;
      }
    });
  }

  void kurangJumlah(int item) {
    setState(() {
      if (item == 1 && quantity1 > 1) {
        quantity1--;
      } else if (item == 2 && quantity2 > 1) {
        quantity2--;
      }
    });
  }

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
        title: Text('Keranjang'),
        backgroundColor: Color.fromRGBO(253, 65, 2, 1),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(253, 65, 2, 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                      onPressed: () => kurangJumlah(1),
                                      iconSize: 20, // Define the icon size
                                      padding: EdgeInsets.zero,
                                      splashRadius: 15,
                                      alignment: Alignment.center,
                                      constraints: BoxConstraints.tightFor(
                                        width: 30,
                                        height: 30,
                                      ),
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      disabledColor: Colors.grey,
                                    ),
                                    Text(
                                      '$quantity1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () => tambahJumlah(1),
                                      constraints: BoxConstraints.tightFor(
                                        width: 20,
                                        height: 20,
                                      ),
                                      padding: EdgeInsets.zero,
                                      splashRadius: 15,
                                      alignment: Alignment.center,
                                      iconSize: 15,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                                      'Nasi Goreng',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                      'Rp 50.000',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(253, 65, 2, 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                      onPressed: () => kurangJumlah(2),
                                      constraints: BoxConstraints.tightFor(
                                        width: 20,
                                        height: 20,
                                      ),
                                      padding: EdgeInsets.zero,
                                      splashRadius: 15,
                                      alignment: Alignment.center,
                                      iconSize: 15,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      disabledColor: Colors.grey,
                                    ),
                                    Text(
                                      '$quantity2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () => tambahJumlah(2),
                                      constraints: BoxConstraints.tightFor(
                                        width: 20,
                                        height: 20,
                                      ),
                                      padding: EdgeInsets.zero,
                                      splashRadius: 15,
                                      alignment: Alignment.center,
                                      iconSize: 15,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(253, 65, 2, 1),
                border: Border.all(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  width: 2,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Harga:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8), // Menambahkan jarak antara teks
                        Text(
                          'Rp 32.000',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodListScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Pesan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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

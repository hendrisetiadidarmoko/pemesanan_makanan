import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/bloc/menu/menu.dart';
import 'package:pemesanan_makanan/ui/foodListComplete_screen.dart';
import 'package:pemesanan_makanan/ui/foodList_screen.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'dart:async';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({Key? key}) : super(key: key);

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  double totalPrice = 0;
  final _firestore = FirebaseFirestore.instance;

  void calculateTotalPrice(List<MenuItem> menuItems) {
    totalPrice = menuItems
        .where((item) => item.value >= 1)
        .fold(0, (sum, item) => sum + item.hargaAkhir);
  }

  String generateOrderNumber() {
    // Generate a random string of length 6
    String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random rnd = Random();
    String result = '';
    for (var i = 0; i < 6; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
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
                  FutureBuilder<List<MenuItem>>(
                    future: fetchMenuItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Failed to load menu items'));
                      } else if (snapshot.hasData) {
                        // Filter menu items with value greater than 0
                        List<MenuItem> filteredItems = snapshot.data!
                            .where((item) => item.value > 0)
                            .toList();

                        // Sort filtered menu items by rating
                        filteredItems.sort((a, b) => b.rate.compareTo(a.rate));
                        // Calculate total price
                        calculateTotalPrice(filteredItems);

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            MenuItem menuItem = filteredItems[index];
                            return Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                menuItem.nama,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children:
                                                    List.generate(5, (index) {
                                                  if (index <
                                                      menuItem.rate.floor()) {
                                                    return Icon(Icons.star,
                                                        color: Colors.amber,
                                                        size: 16);
                                                  } else if (index <
                                                      menuItem.rate) {
                                                    return Icon(Icons.star_half,
                                                        color: Colors.amber,
                                                        size: 16);
                                                  } else {
                                                    return Icon(
                                                        Icons.star_border,
                                                        color: Colors.amber,
                                                        size: 16);
                                                  }
                                                }),
                                              ),
                                              Text(
                                                'Rp ${menuItem.harga}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(253, 65, 2, 1),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.remove),
                                                color: Colors.white,
                                                onPressed: () {
                                                  minMenuItemValue(
                                                      menuItem.id,
                                                      menuItem.value,
                                                      menuItem.harga,
                                                      menuItem.hargaAkhir);

                                                  setState(() {
                                                    // Refresh data
                                                    fetchMenuItems();
                                                  });
                                                },
                                                iconSize: 20,
                                                padding: EdgeInsets.zero,
                                                splashRadius: 15,
                                                alignment: Alignment.center,
                                                constraints:
                                                    BoxConstraints.tightFor(
                                                  width: 30,
                                                  height: 30,
                                                ),
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                disabledColor: Colors.grey,
                                              ),
                                              Text(
                                                '${menuItem.value}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.add),
                                                color: Colors.white,
                                                onPressed: () {
                                                  plushMenuItemValue(
                                                      menuItem.id,
                                                      menuItem.value,
                                                      menuItem.harga,
                                                      menuItem.hargaAkhir);

                                                  setState(() {
                                                    // Refresh data
                                                    fetchMenuItems();
                                                  });
                                                },
                                                constraints:
                                                    BoxConstraints.tightFor(
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                padding: EdgeInsets.zero,
                                                splashRadius: 15,
                                                alignment: Alignment.center,
                                                iconSize: 15,
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
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
                            );
                          },
                        );
                      }
                      return SizedBox(); // Return an empty SizedBox if there is no data
                    },
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
                          'Rp $totalPrice',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        List<MenuItem> menuItems = await fetchMenuItems();
                        List<MenuItem> orderedItems =
                            menuItems.where((item) => item.value > 0).toList();

                        if (orderedItems.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Pilih setidaknya satu menu')),
                          );
                          return;
                        }

                        Map<String, dynamic> riwayatData = {
                          'nomor_pemesanan': generateOrderNumber(),
                          'waktu_pemesanan': DateTime.now(),
                          'harga_akhir': '$totalPrice',
                        };

                        for (int i = 0; i < orderedItems.length; i++) {
                          riwayatData['menu${i + 1}'] = {
                            'nama': orderedItems[i].nama,
                            'harga': orderedItems[i].hargaAkhir,
                          };
                        }

                        await _firestore.collection('riwayat').add(riwayatData);

                        // Set all menu item values to 0
                        for (var item in orderedItems) {
                          defaultMenuItemValue(
                              item.id, item.value, item.harga, item.hargaAkhir);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Riwayat ditambahkan')),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodListCompleteScreen(id_baru: riwayatData)),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Gagal menambahkan riwayat: $e')),
                        );
                      }
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

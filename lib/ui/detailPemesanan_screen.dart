import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting

class DetailPemesananScreen extends StatefulWidget {
  final Map<String, dynamic> order;

  const DetailPemesananScreen({Key? key, required this.order})
      : super(key: key);

  @override
  State<DetailPemesananScreen> createState() => _DetailPemesananScreenState();
}

class _DetailPemesananScreenState extends State<DetailPemesananScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // Extracting data from the order
    String orderNumber = widget.order['nomor_pemesanan'] ?? 'N/A';

    String orderDate = '';
    if (widget.order['waktu_pemesanan'] != null) {
      Timestamp timestamp = widget.order['waktu_pemesanan'];
      DateTime dateTime = timestamp.toDate();
      orderDate = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
    }

    String totalPrice = widget.order['harga_akhir']?.toString() ?? '0';
    List<Map<String, dynamic>> menuItems = widget.order.entries
        .where((entry) => entry.key.startsWith('menu'))
        .map((entry) => entry.value as Map<String, dynamic>)
        .toList();

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
                                  Text('Nomor Pemesanan'),
                                  Text(orderNumber),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Waktu Pemesanan'),
                                  Text(orderDate),
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
                            children: menuItems.map((menuItem) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(menuItem['nama'] ?? ''),
                                      Text('Rp ${menuItem['harga'] ?? 0}'),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                ],
                              );
                            }).toList(),
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
                              Text('Rp $totalPrice'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      _firestore
                          .collection('riwayat')
                          .where('nomor_pemesanan', isEqualTo: orderNumber)
                          .get()
                          .then((snapshot) {
                        snapshot.docs.forEach((doc) {
                          doc.reference.delete();
                        });
                      });
                      Navigator.pop(
                          context); // Kembali ke layar sebelumnya setelah menghapus
                    }, // Call the _editProfile method
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(253, 65, 2, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      "hapus",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
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

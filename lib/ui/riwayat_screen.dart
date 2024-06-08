import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'package:pemesanan_makanan/ui/detailPemesanan_screen.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({Key? key}) : super(key: key);

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchOrderHistory() async {
    QuerySnapshot querySnapshot = await _firestore.collection('riwayat').get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
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
        title: Text('Riwayat'),
        backgroundColor: Color.fromRGBO(253, 65, 2, 1),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchOrderHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load order history'));
          } else if (snapshot.hasData) {
            List<Map<String, dynamic>> orderHistory = snapshot.data!;
            return ListView.builder(
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> order = orderHistory[index];
                int menuCount = order.keys.where((key) => key.startsWith('menu')).length;
                String orderDate = order['waktu_pemesanan'] != null
                    ? (order['waktu_pemesanan'] as Timestamp).toDate().toString()
                    : '';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPemesananScreen(order: order),
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
                          '$menuCount Menu',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          orderDate,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

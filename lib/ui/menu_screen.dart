import 'package:flutter/material.dart';
import 'package:pemesanan_makanan/bloc/menu/menu.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import 'dart:async';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key, required this.menuTitle}) : super(key: key);

  final String menuTitle;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late Future<List<MenuItem>> futureMenuItems;

  @override
  void initState() {
    super.initState();
    futureMenuItems = fetchMenuItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.menuTitle),
        backgroundColor: Color.fromRGBO(253, 65, 2, 1),
      ),
      body: FutureBuilder<List<MenuItem>>(
        future: futureMenuItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load menu items'));
          } else if (snapshot.hasData) {
            List<MenuItem> menuItems = snapshot.data!;
            menuItems = menuItems
                .where((item) => item.jenis == widget.menuTitle)
                .toList();

            return ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                MenuItem menuItem = menuItems[index];
                return Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
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
                                    menuItem.nama,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: List.generate(5, (index) {
                                      if (index < menuItem.rate.floor()) {
                                        return Icon(Icons.star,
                                            color: Colors.amber, size: 16);
                                      } else if (index < menuItem.rate) {
                                        return Icon(Icons.star_half,
                                            color: Colors.amber, size: 16);
                                      } else {
                                        return Icon(Icons.star_border,
                                            color: Colors.amber, size: 16);
                                      }
                                    }),
                                  ),
                                  Text(
                                    'Rp ${menuItem.harga}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateMenuItemValue(menuItem.id, menuItem.value,
                                    menuItem.harga, menuItem.hargaAkhir);

                                setState(() {
                                  // Refresh data
                                  futureMenuItems = fetchMenuItems();
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(253, 65, 2, 1),
                                ),
                                child: Center(
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 15),
                                ),
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
          } else {
            return Center(child: Text('No menu items available'));
          }
        },
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mdi/mdi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemesanan_makanan/ui/login.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import '../utils/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  final nameEdc = TextEditingController();
  final contactEdc = TextEditingController();
  final addressEdc = TextEditingController();
  bool passInvisible = false;

  @override
  @override
  void initState() {
    super.initState();
    // Get the current user's information and set it to the text controllers
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (user.providerData[0].providerId == 'password') {
        // Login menggunakan email dan password
        nameEdc.text = user.displayName ?? '';
        emailEdc.text = user.email ?? '';
      } else if (user.providerData[0].providerId == 'google.com') {
        // Login menggunakan akun Google
        nameEdc.text = user.displayName ?? '';
        emailEdc.text = user.email ?? '';
      } else if (user.providerData[0].providerId == 'phone') {
        // Login menggunakan nomor telepon
        nameEdc.text = user.displayName ?? '';
        contactEdc.text = user.phoneNumber ?? '';
      }
    }
  }

  void _editProfile() {
    String name = nameEdc.text;
    String contact = contactEdc.text;
    String address = addressEdc.text;
    String email = emailEdc.text;
    String password = passEdc.text;

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      user.updateDisplayName(name);
    }

    // Show a message to the user that the profile has been updated
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Profile updated successfully'),
      backgroundColor: Color.fromRGBO(253, 65, 2, 1),
    ));
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
        title: Text('Informasi Akun'),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          child: Container(
            color: Color.fromRGBO(253, 65, 2, 1), // Color of the bottom border
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 200,
              color: Color.fromRGBO(253, 65, 2, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nameEdc,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                      border: OutlineInputBorder(),
                      labelText: 'Nama Pengguna',
                      hintText: 'John Doe',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    enabled: false,
                    controller: contactEdc,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                      border: OutlineInputBorder(),
                      labelText: 'Kontak',
                      hintText: '081234567890',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    enabled: false,
                    controller: emailEdc,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'abc@gmail.com',
                      prefixIcon: Icon(Mdi.email),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _editProfile, // Call the _editProfile method
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(253, 65, 2, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      "Edit Profil",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      GoogleSignIn().signOut();
                      FirebaseAuth.instance
                          .signOut()
                          .then((value) => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Color.fromRGBO(253, 65, 2, 1)),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

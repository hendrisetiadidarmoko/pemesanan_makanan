import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ListView(
          children: [
            Text(
              "Buat Akun Baru",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Nama Lengkap",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailEdc,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                border: OutlineInputBorder(),
                labelText: ' ',
                hintText: 'Input nama lengkap kamu',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Jenis Kelamin",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailEdc,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                border: OutlineInputBorder(),
                labelText: ' ',
                hintText: 'Laki laki atau perempuan',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Nama Pengguna",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailEdc,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                border: OutlineInputBorder(),
                labelText: ' ',
                hintText: 'Input nama panggilan kamu',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Email",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: emailEdc,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                border: OutlineInputBorder(),
                labelText: ' ',
                hintText: 'abc@gmail.com',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "No HP",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailEdc,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                border: OutlineInputBorder(),
                labelText: ' ',
                hintText: 'Input nomer hp kamu',
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Katasandi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: passEdc,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                suffixIcon: IconButton(
                  icon:
                      Icon(passInvisible ? Mdi.eyeOutline : Mdi.eyeOffOutline),
                  onPressed: () {
                    setState(() {
                      passInvisible = !passInvisible;
                    });
                  },
                ),
                border: OutlineInputBorder(),
                labelText: ' ',
                hintText: 'Enter secure password',
              ),
              obscureText: !passInvisible,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Konfirmasi Katasandi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: passEdc,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                suffixIcon: IconButton(
                  icon:
                      Icon(passInvisible ? Mdi.eyeOutline : Mdi.eyeOffOutline),
                  onPressed: () {
                    setState(() {
                      passInvisible = !passInvisible;
                    });
                  },
                ),
                border: OutlineInputBorder(),
                labelText: ' ',
                hintText: 'Enter secure password',
              ),
              obscureText: !passInvisible,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                  activeColor: Color.fromRGBO(253, 65, 2, 1),
                  checkColor: Colors.white,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: BorderSide(
                    color: _isChecked
                        ? Color.fromRGBO(253, 65, 2, 1)
                        : Color.fromRGBO(
                            253, 65, 2, 1), // Warna border saat tidak dicentang
                    width: 2.0, // Ketebalan border
                  ),
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: 'Dengan membuat akun saya menyetujui ',
                      style: TextStyle(color: Colors.black,fontSize: 12),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Syarat & Ketentuan',
                          style: TextStyle(color: Color.fromRGBO(253, 65, 2, 1)),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: ' dan ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Kebijakan Privasi ',
                          style: TextStyle(color: Color.fromRGBO(253, 65, 2, 1)),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: 'Progscript.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(253, 65, 2, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50)),
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                )),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';
import 'package:pemesanan_makanan/register/register_cubit.dart';
import 'package:pemesanan_makanan/utils/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  final confirmPassEdc = TextEditingController(); // New controller for confirm password
  bool passInvisible = false;
  bool _isChecked = false;

  @override
  void dispose() {
    emailEdc.dispose();
    passEdc.dispose();
    confirmPassEdc.dispose(); // Dispose the new controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('Loading..')));
          }
          if (state is RegisterFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
          }
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.green,
              ));
            Navigator.pushNamedAndRemoveUntil(
                context, rLogin, (route) => false);
          }
        },
        child: Container(
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
                "Katasandi",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: passEdc,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                        passInvisible ? Mdi.eyeOutline : Mdi.eyeOffOutline),
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
                controller: confirmPassEdc, // Use the new controller here
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                        passInvisible ? Mdi.eyeOutline : Mdi.eyeOffOutline),
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
                          : Color.fromRGBO(253, 65, 2, 1),
                      width: 2.0,
                    ),
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: 'Dengan membuat akun saya menyetujui ',
                        style: TextStyle(color: Colors.black, fontSize: 12),
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
                  onPressed: () {
                    if (passEdc.text == confirmPassEdc.text) {
                      context.read<RegisterCubit>().register(
                            email: emailEdc.text,
                            password: passEdc.text,
                          );
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text('Passwords do not match!'),
                          backgroundColor: Colors.red,
                        ));
                    }
                  },
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
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mdi/mdi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pemesanan_makanan/bloc/login/login_cubit.dart';
import 'package:pemesanan_makanan/ui/phone_auth_screen.dart';
import 'package:pemesanan_makanan/utils/navigator.dart';
import '../utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;
  bool _isChecked = false;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) async => await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => NavigatorScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('Loading..')));
          }
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ));
          }
          if (state is LoginSuccess) {
// context.read<AuthCubit>().loggedIn();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.green,
              ));
            Navigator.pushNamedAndRemoveUntil(context, rHome, (route) => false);
          }
        },
        child: Container(
          child: ListView(
            children: [
              Container(
                height: 200,
                color: Color.fromRGBO(253, 65, 2, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //image
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailEdc,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'abc@gmail.com',
                        prefixIcon: Icon(Mdi.email),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passEdc,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        prefixIcon: Icon(Mdi.lock),
                        suffixIcon: IconButton(
                          icon: Icon(passInvisible
                              ? Mdi.eyeOutline
                              : Mdi.eyeOffOutline),
                          onPressed: () {
                            setState(() {
                              passInvisible = !passInvisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                      ),
                      obscureText: !passInvisible,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value ?? false;
                                });
                              },
                            ),
                            Text("Ingat Saya"),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "Lupa katasandi?",
                            style:
                                TextStyle(color: Color.fromRGBO(253, 65, 2, 1)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().login(
                            email: emailEdc.text, password: passEdc.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(253, 65, 2, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun ?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "daftar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(253, 65, 2, 1)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                            endIndent: 1,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Atau masuk melalui"),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 1,
                            endIndent: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            signInWithGoogle();
                          },
                          child: const CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(
                                'https://e7.pngegg.com/pngimages/63/1016/png-clipart-google-logo-google-logo-g-suite-chrome-text-logo.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneAuthScreen()));
                          },
                          child: const CircleAvatar(
                            radius: 20.0,
                            backgroundImage: NetworkImage(
                                'https://i.pinimg.com/736x/02/df/45/02df45f123cae494fd18f0a091f18b31.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

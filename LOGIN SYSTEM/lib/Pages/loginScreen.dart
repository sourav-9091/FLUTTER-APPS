import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiitpass/Pages/DummyPage.dart';
import 'package:kiitpass/Pages/dashBoard.dart';
import 'package:kiitpass/Pages/mysql.dart';
import 'package:kiitpass/Pages/textField.dart';
import 'package:kiitpass/Widgets/AlertBox.dart';
import 'package:kiitpass/Pages/genderPage.dart';
import 'package:kiitpass/Pages/singUp.dart';
import 'package:kiitpass/Pages/test.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 70,
              ),
              SvgPicture.asset(
                'assets/login.svg',
                height: 380,
                width: 300,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 1),
                child: TextField(
                  controller: _email,
                  cursorColor: Colors.grey,
                  //keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "EMAIL",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                child: TextField(
                  obscureText: true,
                  controller: _pass,
                  cursorColor: Colors.grey,
                  //keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "FORGOT PASSWORD?",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: SizedBox(
                  width: 340,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: (() async {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return Test();
                      // }));
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _email.text, password: _pass.text);
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return (Dashboard());
                        })));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AlertBox(
                                content: 'NO USER FOUND FOR THIS EMAIL.');
                          }));
                        } else if (e.code == 'wrong-password') {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return AlertBox(
                                content:
                                    'WRONG PASSWORD PROVIDED FOR THAT USER.');
                          }));
                        }
                      }
                    }),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.green)))),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GenderPage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

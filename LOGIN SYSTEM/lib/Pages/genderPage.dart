import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kiitpass/Pages/singUp.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  var gender = TextEditingController(text: 'male');
  var femalePath = TextEditingController(text: 'assets/female.svg');
  var malePath = TextEditingController(text: 'assets/man.svg');

  // Future registerUser() async {
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _email.text,
  //       password: _passconfirm.text,
  //     );
  //     try {
  //       //await credential.sendEmailVerification();
  //     } catch (e) {}

  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return LoginPage();
  //     }));
  //     print("USER AUTENTICATED SUCCESSFULLY");
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    setState(() {
      gender;
      femalePath;
      malePath;
    });

    // bool getBool(String str) {

    //   return str=='male'?true:false;
    // }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "CHOOSE YOUR GENDER",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                // Container(
                //   child: CircleAvatar(
                //     radius: 70,
                //     backgroundColor: Colors.transparent,
                //     backgroundImage: SvgPicture.asset(
                //       'assets/man.svg',
                //       height: 380,
                //       width: 300,
                //     ) as ImageProvider,
                //   ),
                // ),
                Container(
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      malePath.text,
                      height: 130,
                      width: 130,
                    ),
                    onTap: () {
                      // if (gender.text == 'female') {
                      //   malePath.text = 'assets/manBorder.svg';
                      //   femalePath.text = 'assets/female.svg';
                      // }
                      // gender.text = 'male';
                      // if (gender.text == 'male') {
                      //   malePath.text = 'assets/manBorder.svg';
                      // }
                      setState(() {
                        gender.text = 'male';
                        malePath.text = 'assets/manBorder.svg';
                        femalePath.text = 'assets/female.svg';
                      });
                    },
                  ),
                ),

                SizedBox(
                  width: 50,
                ),
                // Container(
                //   child: CircleAvatar(
                //     radius: 70,
                //     backgroundColor: Colors.transparent,
                //     backgroundImage: SvgPicture.asset(
                //       'assets/man.svg',
                //       height: 380,
                //       width: 300,
                //     ) as ImageProvider,
                //   ),
                // ),
                Container(
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      femalePath.text,
                      height: 130,
                      width: 130,
                    ),
                    onTap: (() {
                      // if (gender.text == 'female') {}
                      // if (gender.text == 'male') {
                      //   femalePath.text = 'assets/femaleGreen.svg';
                      //   malePath.text = 'assets/man.svg';
                      // }
                      // gender.text = 'female';
                      // if (gender.text == 'female') {
                      //   femalePath.text = 'assets/femaleGreen.svg';
                      // }
                      setState(() {
                        gender.text = 'female';
                        femalePath.text = 'assets/femaleGreen.svg';
                        malePath.text = 'assets/man.svg';
                      });
                    }),
                  ),
                )
              ],
            ),
            Container(
              child: Center(
                child: CustomPaint(
                  size: Size(300, 50),
                  painter: LinePainter(),
                ),
              ),
            ),
            Text(
              "CHOOSE YOUR HOSTEL NUMBER",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 340,
              child: Container(
                child: DropdownButtonFormField<String>(
                  // underline: Container(
                  //   color: Colors.white,
                  // ),
                  borderRadius: BorderRadius.circular(5),
                  elevation: 0,
                  focusColor: Colors.white,
                  value: '1',
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "SELETE",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  // onChanged: (String value) {
                  //   setState(() {
                  //     _chosenValue = value;
                  //   });
                  // },
                  onChanged: ((value) {}),
                ),
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Container(
              child: SizedBox(
                width: 340,
                height: 58,
                child: ElevatedButton(
                  onPressed: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUpPage(
                        gen: gender.text,
                        hostelName: 'KINGS PALACE 5',
                      );
                    }));
                  }),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)))),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

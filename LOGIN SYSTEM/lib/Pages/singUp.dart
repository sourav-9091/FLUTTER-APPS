import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiitpass/Pages/loginScreen.dart';
import 'package:kiitpass/Widgets/AlertBox.dart';
import 'package:kiitpass/Pages/genderPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

String str = "MALE";

FirebaseFirestore firestore = FirebaseFirestore.instance;

// class AddUser extends StatelessWidget {
// final int rollNo;
// final String hostelName;
// final String Fullname;
// final bool gender;

// AddUser(
//   this.rollNo,
//   this.hostelName,
//   this.Fullname,
//   this.gender,
// );

// @override
// Widget build(BuildContext context) {
// Create a CollectionReference called users that references the firestore collection
// CollectionReference users =
//     FirebaseFirestore.instance.collection('Students');

//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//             'Gender': gender, // John Doe
//             'Hostel Name': hostelName, // Stokes and Sons
//             'Name': Fullname,
//             'Roll No': rollNo, // 42
//           })
//           .then((value) => print("Student Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }

//     return TextButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
// }

// import 'package:firebase_auth';

class SignUpPage extends StatefulWidget {
  final String hostelName;
  final String gen;
  const SignUpPage({
    super.key,
    required this.hostelName,
    required this.gen,
  });
  // str = gen;

  // String gender() {
  //   return gen;
  // }

  @override
  State<SignUpPage> createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _passconfirm = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('Students');

  // get gender => this.gender;

  get hostelName => this.hostelName;

  get Fullname => _name.text;

  get rollNo => int.parse(_email.text.split('@')[0]);

  // get gender => gen;

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'Gender': "MALE",
          'Hostel Name': 'KINGS PALACE',
          'Name': Fullname,
          'Roll No': rollNo,
        })
        .then((value) => print("Student Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // Future sentVerification() async {
  //   FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: _email.text, password: _pass.text);
  //    try {
  //       await user.sendEmailVerification();
  //       return user.uid;
  //    } catch (e) {
  //       print("An error occured while trying to send email verification");
  //       print(e.message);
  //    }
  //  }
  // }

  Future registerUser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _passconfirm.text,
      );
      try {
        //await credential.sendEmailVerification();
      } catch (e) {}

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
      print(int.parse(_email.text.split('@')[0]));
      addUser();
      print("USER AUTENTICATED SUCCESSFULLY");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 50,
              ),
              SvgPicture.asset(
                'assets/SignUp1.svg',
                height: 350,
                width: 300,
              ),
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "CREATE YOU ACCOUNT",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
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
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: TextField(
                  controller: _name,
                  cursorColor: Colors.grey,
                  //keyboardType: TextInputType.number,
                  //obscureText: true,
                  decoration: InputDecoration(
                    labelText: "NAME",
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
                padding: const EdgeInsets.fromLTRB(25, 1, 25, 10),
                child: TextField(
                  controller: _passconfirm,
                  cursorColor: Colors.grey,
                  obscureText: true,
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
                height: 25,
              ),
              Container(
                child: SizedBox(
                  width: 340,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GenderPage();
                      }));
                      registerUser();
                    }),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.green)))),
                    child: const Text(
                      "SIGN UP",
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
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
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

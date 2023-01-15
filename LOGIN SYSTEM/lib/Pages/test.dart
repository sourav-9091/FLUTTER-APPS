import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kiitpass/Pages/loginScreen.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child: Text("Sign Out")),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "CONTACT US",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Column(
                      children: [
                        Text(
                          "WE ARE UNKNOWN CLUB",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "CONTACT :- 9999999999",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "EMAIL :- test@test.com",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "ADDRESS :- BBSR",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 500,
                        ),
                        ElevatedButton(
                          onPressed: (() {
                            Navigator.of(context).pop();
                          }),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Text(
                            "CLOSE",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

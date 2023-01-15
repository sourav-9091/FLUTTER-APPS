import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
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
                        "GITHUB",
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
                      child: Text(
                          "https://docs.flutter.io/flutter/services/UrlLauncher-class.html"),
                      //onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 550,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: (() {
                            Navigator.of(context).pop();
                          }),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: const Text(
                            "CLOSE",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

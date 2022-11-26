import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class ContentPageDark extends StatelessWidget {
  const ContentPageDark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        child: Scaffold(
          backgroundColor: Colors.black,
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
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Text(
                        "https://docs.flutter.io/flutter/services/UrlLauncher-class.html",
                        style: TextStyle(color: Colors.white),
                      ),

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

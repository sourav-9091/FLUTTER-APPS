import 'package:attend/Pages/contentPage.dart';
import 'package:attend/Widgets/aboutUs.dart';
import 'package:flutter/material.dart';

import 'contactUs.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
         DrawerHeader(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: Image.asset('assets/iconLight.png'),
          ),
        ),
        ListTile(
          title: GestureDetector(
            child: const Text(
              'GITHUB',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    child: ContentPage(),
                  );
                }),
          ),
          leading: Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: GestureDetector(
            child: Text(
              'ABOUT US',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return AboutUsPage();
                }),
          ),
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: GestureDetector(
            child: Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return ContactUsPage();
                }),
          ),
          leading: Icon(
            Icons.phone,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

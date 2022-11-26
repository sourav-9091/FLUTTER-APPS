import 'package:attend/Pages/contentPageDark.dart';
import 'package:flutter/material.dart';

import 'aboutUsDark.dart';
import 'contactUsDark.dart';

class DrawerWidgetDark extends StatelessWidget {
  const DrawerWidgetDark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              backgroundColor: Colors.white,
            child: Image.asset('assets/iconDark.png'),
            ),
          ),
          ListTile(
            title: GestureDetector(
              child: Text(
                'GITHUB',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    child: ContentPageDark(),
                  );
                }),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: GestureDetector(
              child: Text(
                'ABOUT US',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    child: AboutUsPageDark(),
                  );
                }),
            ),
            leading: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: GestureDetector(
              child: Text(
                'CONTACT US',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    child: ContactUsPageDark(),
                  );
                }),
            ),
            leading: Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

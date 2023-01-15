import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/screen1.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              height: 44.0 + MediaQuery.of(context).padding.bottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  
                ],
              ),
            ),
            body: Text("Hello world"))
      ],
    );
    ;
  }
}

import 'package:flutter/material.dart';
import 'package:kiitpass/Widgets/AlertBox.dart';
import 'package:kiitpass/main.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextWidget1(),
    );
  }
}

class TextWidget1 extends StatefulWidget {
  const TextWidget1({super.key});

  @override
  State<TextWidget1> createState() => _TextWidget1State();
}

class _TextWidget1State extends State<TextWidget1> {
  final name = TextEditingController(text: 'Aditya Choudary');
  final rollNo = TextEditingController(text: '2128094');
  final toControl = TextEditingController(text:'GYM');
  final outControl = TextEditingController(text: '8:00 AM');
  final inControl = TextEditingController(text: 'NULL');
  @override
  Widget build(BuildContext context) {
    Future connet() async {
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: 'unknownclub.me',
          port: 3306,
          user: 'u787033614_unknownclub',
          db: ' u787033614_epass',
          password: 'N9>Oeqz9&A'));

      var result = await conn.query(
          'insert into users (name, email, age) values (?, ?, ?)',
          ['Bob', 'bob@bob.com', 25]);
      print('Inserted row id=${result.insertId}');
      AlertBox(
        content: 'SUCCESSFULLY INSERTED INTO DATABASE',
      );

      await conn.close();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("KIIT PASS"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (() {}),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green)))),
            child: const Text(
              "IN",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kiitpass/Widgets/AlertBox.dart';
import 'package:kiitpass/main.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green))),
      ),
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
  final name = TextEditingController(text: 'Ukarsh Nigam');
  final rollNo = TextEditingController(text: '2128108');
  final toControl = TextEditingController(text: 'GYM');
  final outControl = TextEditingController(text: '8:00 AM');
  final inControl = TextEditingController(text: 'NULL');
  @override
  Widget build(BuildContext context) {
    // Future connet() async {
    //   // Open a connection (testdb should already exist)
    //   final conn = await MySqlConnection.connect(ConnectionSettings(
    //       // useSSL: true,

    //       host: '217.21.91.103',
    //       port: 3306,
    //       user: 'u787033614_unknownclub',
    //       db: ' u787033614_epass',
    //       password: 'N9>Oeqz9&A'));

    //   var result = await conn.query(
    //       'insert into overview (name, roll, place, status, out_t, in_t) values (?, ?, ?)',
    //       [
    //         'Aditya Choudhury',
    //         '2129011',
    //         'Gym',
    //         'Out',
    //         '11:13:33',
    //         '11:15:33'
    //       ]);
    //   print('Inserted row id=${result.insertId}');
    //   AlertBox(
    //     content: 'SUCCESSFULLY INSERTED INTO DATABASE',
    //   );

    //   await conn.close();
    // }

    List<String> hello = ['fhds'];

    // Future<List> senddata() async {
    //   final response =
    //       await http.post();
    //   return hello;
    // }


    // Future<List> senddata() async {
    //   final response =
    //       await http.post(Uri.https( 'https://unknownclub.me/api/index.php',
    //       {
    //         "name": 'Aditya Choudhury',
    //         "roll":'2129011',
    //         "place":'Gym',
    //         "status":'Out',
    //         "out_t":'11:13:33',
    //         "in_t":'11:15:33'
    //   }));
    //   return hello;
    // }
    // var datauser = json.decode(response.body);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("KIIT PASS"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 1),
              child: TextField(
                controller: name,
                cursorColor: Colors.grey,
                //keyboardType: TextInputType.number,
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
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
              child: TextField(
                //obscureText: true,
                controller: rollNo,
                cursorColor: Colors.grey,
                //keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "ROLL NO",
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
              padding: EdgeInsets.fromLTRB(25, 25, 25, 1),
              child: TextField(
                controller: toControl,
                cursorColor: Colors.grey,
                //keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "TO",
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
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
              child: TextField(
                //obscureText: true,
                controller: outControl,
                cursorColor: Colors.grey,
                //keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "OUT TIME",
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
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 10),
              child: TextField(
                //obscureText: true,
                controller: inControl,
                cursorColor: Colors.grey,
                //keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "IN TIME",
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
            ElevatedButton(
              onPressed: (() {
                // connet();
                // senddata();
              }),
              style: ButtonStyle(
                  // backgroundColor: Colors.green,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.green)))),
              child: const Text(
                "ASK PERMISSION",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

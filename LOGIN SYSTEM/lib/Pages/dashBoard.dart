import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiitpass/Widgets/AlertBox.dart';
import 'dart:async';

import 'package:mysql1/mysql1.dart';

Future connect() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'sql830.main-hosting.eu',
      port: 3306,
      user: 'u787033614_unknownclub',
      db: 'u787033614_epass',
      password: 'N9>Oeqz9&A'));

  // Create a table
  // await conn.query(
  //     'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');

  // Insert some data
  // await conn.query(
  //     'insert into overview (name,roll, place, status, out_t, in_t) values (?, ?, ?, ?, ?, NULL)',
  //     ['Utkarsh Nigam', '2128108', 'Gym', 'Out', '11:13:33']);
  // await conn.query(
  //     'insert into overview (name,roll, place, status, out_t, in_t) values (?, ?, ?, ?, ?, NULL)',
  //     ['Aditya Choudary', '2129011', 'Library', 'Out', '16:11:44']);
  // await conn.query(
  //     'insert into overview (name,roll, place, status, out_t, in_t) values (?, ?, ?, ?, ?, NULL)',
  //     ['Hemang Mitra', '2128074', 'Gym', 'Out', '19:10:34']);
  await conn.query(
      'insert into overview (name,roll, place, status, out_t, in_t) values (?, ?, ?, ?, ?, NULL)',
      ['Sourav Goel', '2128094', 'Gym', 'Out', '16:23:12']);

  // dbcontroller.text = await conn.query('select * from overview');

  // Query the database using a parameterized query
  // var results = await conn.query(
  //     'select name, email, age from users where id = ?', [result.insertId]);
  // for (var row in results) {
  //   dbcontroller.text = ('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  //

  //   var results = await conn.query(
  //     'select * from overview',);
  // for (var row in results) {
  //   print('Name: ${row[0]}, RollNo: ${row[1]}, Place: ${row[2]}, Status: ${row[3]}, OutTime: ${row[4]}, OutTime: ${row[5]}');
  // }

  // Update some data
  // await conn.query('update users set age=? where name=?', [26, 'Bob']);

  // Query again database using a parameterized query
  // var results2 = await conn.query(
  //     'select name, email, age from users where id = ?', [result.insertId]);
  // for (var row in results2) {
  //   print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  // }

  // Finally, close the connection
  await conn.close();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Dashboard(),
  ));
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Text(
              "Hello,",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Sourav Goel",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "kp 5",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Container(
                  child: Row(
                    children: [
                      // SizedBox(
                      //   height: 50,
                      // ),
                      SvgPicture.asset(
                        'assets/gymBox.svg',
                        height: 80,
                        width: 80,
                      ),
                      // Text('GYM'),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height :
                // ),
                Container(
                  child: Row(
                    children: [
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text('LIBRARY'),
                      SvgPicture.asset(
                        'assets/libraryBox.svg',
                        height: 80,
                        width: 80,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   "CURRENT OUT",
            //   style: TextStyle(
            //     fontSize: 25,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // SvgPicture.asset(
            //   'assets/gym.svg',
            //   height: 100,
            //   width: 500,
            // ),

            Container(
              child: SizedBox(
                width: 340,
                height: 58,
                child: ElevatedButton(
                  onPressed: (() {
                    connect();
                    AlertBox(content: "PASSWORD GENERATED SUCCESSFULLY");
                  }),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)))),
                  child: const Text(
                    "GENERATE PASS",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

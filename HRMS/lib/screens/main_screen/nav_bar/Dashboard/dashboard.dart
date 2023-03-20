import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/hospitality.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/kiit.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/kims.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/kiss.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/resetPassword.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/temple.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  // SizedBox(
                  //   height: 50,
                  // ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                          child: Card(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(8)),
                            // elevation: 4,
                            // child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     Image.asset(
                            //       'assets/student.png',
                            //       height: 100,
                            //     ),
                            //     Text(
                            //       'KIIT',
                            //       style: cardTextStyle,
                            //     )
                            //   ],
                            // ),
                            color: Colors.transparent,
                            elevation: 0,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/dashboard/4.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => KIIT())));
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(8)),
                            // elevation: 4,
                            // child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     Image.asset(
                            //       'assets/student.png',
                            //       height: 100,
                            //     ),
                            //     Text(
                            //       'KIIT',
                            //       style: cardTextStyle,
                            //     )
                            //   ],
                            // ),
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/dashboard/3.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => KIIS())));
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(8)),
                            // elevation: 4,
                            // child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     Image.asset(
                            //       'assets/student.png',
                            //       height: 100,
                            //     ),
                            //     Text(
                            //       'KIIT',
                            //       style: cardTextStyle,
                            //     )
                            //   ],
                            // ),
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/dashboard/5.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => HOSPITALITY())));
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(8)),
                            // elevation: 4,
                            // child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     Image.asset(
                            //       'assets/student.png',
                            //       height: 100,
                            //     ),
                            //     Text(
                            //       'KIIT',
                            //       style: cardTextStyle,
                            //     )
                            //   ],
                            // ),
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/dashboard/1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => KIIMS())));
                          },
                        ),
                        GestureDetector(
                          child: Card(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(8)),
                            // elevation: 4,
                            // child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     Image.asset(
                            //       'assets/student.png',
                            //       height: 100,
                            //     ),
                            //     Text(
                            //       'KIIT',
                            //       style: cardTextStyle,
                            //     )
                            //   ],
                            // ),
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/dashboard/2.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => TEMPLE())));
                          },
                        ),
                        // GestureDetector(
                        //   child: Card(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(8)),
                        //     elevation: 4,
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: <Widget>[
                        //         Image.asset(
                        //           'assets/forgetPassword.png',
                        //           height: 100,
                        //         ),
                        //         Text(
                        //           'RESET PASSWORD',
                        //           style: cardTextStyle,
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: ((context) => ForgetPassword())));
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

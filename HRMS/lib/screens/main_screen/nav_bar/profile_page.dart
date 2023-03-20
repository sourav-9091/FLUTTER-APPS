import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hrms/logic/auth_bloc/auth_bloc.dart';
import 'package:hrms/logic/auth_bloc/auth_event.dart';
import 'package:hrms/screens/main_screen/nav_bar/edit_profile_page.dart';
import 'package:hrms/screens/model/user.dart';
import 'package:hrms/screens/widget/profile_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // var user = UserPreferences.myUser;

  final _MyBox = Hive.box('data');

  @override
  Widget build(BuildContext context) {
    // final user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          print("I am called");
          var userResponse = await http.get(
              Uri.parse("http://${_MyBox.get("baseUrl")}:5000/api/app/user/"),
              headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

          print("The userStatus status code is :- " +
              userResponse.statusCode.toString());

          if (userResponse.statusCode == 200) {
            var jsonDataUser = json.decode(userResponse.body);
            _MyBox.put("firstName", jsonDataUser['fname']);
            _MyBox.put("lastName", jsonDataUser['lname']);
            _MyBox.put('department', jsonDataUser['department']);
            _MyBox.put('username', jsonDataUser['username']);
            _MyBox.put('verifiedEmail', jsonDataUser['verified']);
            _MyBox.put('level', jsonDataUser['level']);
            _MyBox.put('email', jsonDataUser['email']);
            _MyBox.put('pass_reset', jsonDataUser['pass_reset']);
            _MyBox.put('mobile', jsonDataUser['mobile']);
            _MyBox.put('address', jsonDataUser['address']);
            _MyBox.put('pass_reset', jsonDataUser['pass_reset']);

            print(
                "***********************************I am Verification Status ******************************:- " +
                    _MyBox.get("verifiedEmail").toString());

            _MyBox.put('id', jsonDataUser['_id']);
          }
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath:
                  "http://${_MyBox.get("baseUrl")}:5000/images?username=${_MyBox.get("username")}&filename=pp",
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => MaterialApp(
                            home: EditProfilePage(),
                            debugShowCheckedModeBanner: false,
                          )),
                );
              },
            ),
            // CachedNetworkImage(
            //   imageUrl: "http://192.168.37.145:5000/images?username=${_MyBox.get('username')}&filename=pp",
            //   placeholder: (context, url) => new CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => new Icon(Icons.error),
            // ),
            const SizedBox(height: 24),
            buildName(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Employee ID :- ${_MyBox.get('username')}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Image.asset(
                //   "assets/TwitterTick.png",
                //   height: 60,
                //   width: 60,
                // ),
              ],
            ),
            Text(
              'Department :- ${_MyBox.get('department')}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Level :- ${_MyBox.get('level')} - SuperAdmin',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  data:
                      "Name :- ${_MyBox.get('firstName')}\nEmp_id :- ${_MyBox.get('lastName')}\nLevel :- ${_MyBox.get('level')}",
                  size: 180,
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: const Size(
                      100,
                      100,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                onPrimary: Colors.white,
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text("LOGOUT"),
              onPressed: (() {
                Future<bool> _onWillPop() async {
                  return (await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: new Text('Are You Sure ?'),
                          content: new Text('Want to logout from hrms ?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: new Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(
                                  LoggedOut(),
                                );
                              },
                              child: new Text('Yes'),
                            ),
                          ],
                        ),
                      )) ??
                      false;
                }

                _onWillPop();
              }),
            )),

            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                onPrimary: Colors.white,
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text("REFRESH"),
              onPressed: (() async {
                // Future<bool> _onWillPop() async {
                //   return (await showDialog(
                //         context: context,
                //         builder: (context) => AlertDialog(
                //           title: new Text('Are You Sure ?'),
                //           content: new Text('Want to logout from hrms ?'),
                //           actions: <Widget>[
                //             TextButton(
                //               onPressed: () {
                //                 Navigator.of(context).pop(false);
                //               },
                //               child: new Text('No'),
                //             ),
                //             TextButton(
                //               onPressed: () {
                //                 Navigator.of(context).pop(true);
                //                 BlocProvider.of<AuthenticationBloc>(context)
                //                     .add(
                //                   LoggedOut(),
                //                 );
                //               },
                //               child: new Text('Yes'),
                //             ),
                //           ],
                //         ),
                //       )) ??
                //       false;
                // }

                // _onWillPop();

                var userResponse = await http.get(
                    Uri.parse(
                        "http://${_MyBox.get("baseUrl")}:5000/api/app/user/"),
                    headers: {
                      'Authorization': 'Bearer ${_MyBox.get('token')}'
                    });

                print("The userStatus status code is :- " +
                    userResponse.statusCode.toString());

                if (userResponse.statusCode == 200) {
                  var jsonDataUser = json.decode(userResponse.body);
                  _MyBox.put("firstName", jsonDataUser['fname']);
                  _MyBox.put("lastName", jsonDataUser['lname']);
                  _MyBox.put('department', jsonDataUser['department']);
                  _MyBox.put('username', jsonDataUser['username']);
                  _MyBox.put('verifiedEmail', jsonDataUser['verified']);
                  _MyBox.put('level', jsonDataUser['level']);
                  _MyBox.put('email', jsonDataUser['email']);
                  _MyBox.put('pass_reset', jsonDataUser['pass_reset']);
                  _MyBox.put('mobile', jsonDataUser['mobile']);
                  _MyBox.put('address', jsonDataUser['address']);
                  _MyBox.put('pass_reset', jsonDataUser['pass_reset']);

                  print(
                      "***********************************I am Verification Status ******************************:- " +
                          _MyBox.get("verifiedEmail").toString());

                  _MyBox.put('id', jsonDataUser['_id']);

                  setState(() {
                    _MyBox.get("firstName");
                    _MyBox.get("lastName");
                    _MyBox.get('department');
                    _MyBox.get('username');
                    _MyBox.get('verifiedEmail');
                    _MyBox.get('level');
                    _MyBox.get('email');
                    _MyBox.get('pass_reset');
                    _MyBox.get('mobile');
                    _MyBox.get('address');
                    _MyBox.get('pass_reset');
                  });
                }
              }),
            )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Image.asset(
                    "assets/facebook.png",
                    height: 35,
                    width: 35,
                  ),
                  onTap: () {
                    // _launchURLApp() async {
                    //   const url = 'https://flutterdevs.com/';
                    //   if (await canLaunch(url)) {
                    //     await launch(url,
                    //         forceSafariVC: true, forceWebView: true);
                    //   } else {
                    //     throw 'Could not launch $url';
                    //   }
                    // }

                    // _launchURLApp();
                    launch("https://www.facebook.com/KIITUniversity/",
                        forceWebView: true);
                  },
                ),
                InkWell(
                  child: Image.asset(
                    "assets/instagram.png",
                    height: 35,
                    width: 35,
                  ),
                  onTap: () {
                    launch("https://www.instagram.com/kiituniversity/?hl=en",
                        forceWebView: true);
                  },
                ),
                InkWell(
                  child: Image.asset(
                    "assets/twitter.png",
                    height: 35,
                    width: 35,
                  ),
                  onTap: () {
                    launch(
                        "https://twitter.com/KIITUniversity?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor",
                        forceWebView: true);
                  },
                ),
                InkWell(
                  child: Image.asset(
                    "assets/youtube.png",
                    height: 35,
                    width: 35,
                  ),
                  onTap: () {
                    launch(
                        "https://www.youtube.com/channel/UC2x7DxsTyZj7XBa3hlLVPCQ",
                        forceWebView: true);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

final _MyBox = Hive.box('data');
Widget buildName() => Column(
      children: [
        Text(
          "${_MyBox.get('firstName')} ${_MyBox.get('lastName')}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          "${_MyBox.get('email')}",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );

Widget buildAbout(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            user.about,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );

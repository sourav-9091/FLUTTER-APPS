import 'dart:convert';
import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../../logic/auth_bloc/auth_bloc.dart';
import '../../logic/auth_bloc/auth_event.dart';
import 'nav_bar/Dashboard/resetPassword2.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var str1 = TextEditingController();
  var str2 = TextEditingController();
  var str3 = TextEditingController();
  var str4 = TextEditingController();
  var str5 = TextEditingController();
  var str6 = TextEditingController();

  final _MyBox = Hive.box('data');
  bool isLoading = true;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Are You Sure ?'),
            content: new Text('Want to exit from hrms ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                  Navigator.of(context).pop(true);
                  BlocProvider.of<AuthenticationBloc>(context).add(
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.green.shade50,
              backgroundImage: NetworkImage(
                  "http://${_MyBox.get("baseUrl")}:5000/images?username=${_MyBox.get('username')}&filename=pp"),
            ),
          ),
          title: Text(
            "HRMS",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  EvaIcons.logOutOutline,
                  color: Colors.black,
                ),
                onPressed: () {
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
                                  // Navigator.of(context).pop(true);
                                  // BlocProvider.of<AuthenticationBloc>(context)
                                  //     .add(
                                  //   LoggedOut(),
                                  // );
                                  int count = 0;
                                  Navigator.of(context)
                                      .popUntil((_) => count++ >= 2);
                                },
                                child: new Text('Yes'),
                              ),
                            ],
                          ),
                        )) ??
                        false;
                  }

                  _onWillPop();
                })
          ],
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/kiitLogo.png',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your OTP code number",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  padding: EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(
                            first: true,
                            last: false,
                            controller: str1,
                          ),
                          _textFieldOTP(
                            first: false,
                            last: false,
                            controller: str2,
                          ),
                          _textFieldOTP(
                            first: false,
                            last: false,
                            controller: str3,
                          ),
                          _textFieldOTP(
                            first: false,
                            last: false,
                            controller: str4,
                          ),
                          _textFieldOTP(
                            first: false,
                            last: false,
                            controller: str5,
                          ),
                          _textFieldOTP(
                            first: false,
                            last: true,
                            controller: str6,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      isLoading
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  await verifyOTP(
                                    _MyBox.get('username'),
                                    "${str1.text}${str2.text}${str3.text}${str4.text}${str5.text}${str6.text}",
                                  );
                                  setState(() {
                                    isLoading = true;
                                  });
                                  if (_MyBox.get('otpVerifyStatus') ==
                                      "false") {
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Something Went Wrong! Try Again'));

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  if (_MyBox.get('otpVerifyStatus') == "true") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                ForgetPasswordTwo())));
                                  }
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Text(
                                    'Verify',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          : Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP(
      {bool? first, bool? last, TextEditingController? controller}) {
    return Container(
      height: 45,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          textCapitalization: TextCapitalization.characters,
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          // keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.green),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}

Future<String> verifyOTP(
  String username,
  String otp,
) async {
  final _MyBox = Hive.box('data');
  Map data = {"otp": "$otp", "username": "$username"};
  var body = json.encode(data);
  try {
    var response = await http.post(
        Uri.parse("http://${_MyBox.get("baseUrl")}:5000/api/auth/verify_user"),
        headers: {"Content-Type": "application/json"},
        body: body);
    print("response code is ${response.statusCode}");
    if (response.statusCode == 200) {
      print("I am here jdfndsjhfdjkfakdsjlnf");
      _MyBox.put("otpVerifyStatus", "true");
      return "true";
    }
    if (response.statusCode == 401) {
      _MyBox.put("otpVerifyStatus", "false");
    }
  } on SocketException {
    print('No Internet connection 😑');
    _MyBox.put("otpVerifyStatus", "false");
  } on HttpException {
    print("Couldn't find the post 😱");
    _MyBox.put("otpVerifyStatus", "false");
  } on FormatException {
    print("Bad response format 👎");
    _MyBox.put("otpVerifyStatus", "false");
  }

  return "false";
}



//             // isLoading1
//             //     ? ElevatedButton(
//             //         onPressed: () async {
//             //           setState(() {
//             //             isLoading1 = false;
//             //           });
//             //           await verifyOTP(
//             //             _MyBox.get('username'),
//             //             otpController.text,
//             //           );
//             //           setState(() {
//             //             isLoading1 = true;
//             //           });
//             //           if (_MyBox.get('otpVerifyStatus') == "true") {
//             //             Navigator.of(context).push(MaterialPageRoute(
//             //                 builder: ((context) => ForgetPasswordTwo())));
//             //           }
//             //         },
//             //         child: Text("VERIFY"))
//             //     : Center(child: CircularProgressIndicator()),
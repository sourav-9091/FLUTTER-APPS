// import 'package:flutter/material.dart';

// class IPSettings extends StatefulWidget {
//   const IPSettings({super.key});

//   @override
//   State<IPSettings> createState() => _IPSettingsState();
// }

// class _IPSettingsState extends State<IPSettings> {
//   @override
//   final urlController = TextEditingController();

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("CHANGE YOUR IP ADDRESS"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//             child: TextField(
//               controller: urlController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Enter Base Url',
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//             child: TextField(
//               controller: urlController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Enter Full Url',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:hive/hive.dart';
// import 'package:hrms/screens/main_screen/main_screen.dart';
// import 'package:hrms/screens/main_screen/nav_bar/Dashboard/dashboard.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// import 'newDashboard.dart';

// class ForgetPasswordTwo extends StatefulWidget {
//   ForgetPasswordTwo({super.key});

//   @override
//   State<ForgetPasswordTwo> createState() => _ForgetPasswordTwoState();
// }

// class _ForgetPasswordTwoState extends State<ForgetPasswordTwo> {
//   String dropdownvalue = 'Relative';
//   final List<String> items = [
//     'CHILD OF A FRIEND',
//     'CHILD\'S RELATIVE',
//     'OTHERS',
//   ];
//   String? selectedValue;

//   String dropdownvalue1 = 'Department';
//   final List<String> items1 = [
//     'ITI',
//     'ENGINEERING',
//     'POLYTECHNIC',
//   ];
//   String? selectedValue1;

//   final add_ref_no = TextEditingController();
//   final name = TextEditingController();
//   final state = TextEditingController();
//   final city = TextEditingController();
//   final amt_paid = TextEditingController();
//   final contact_no = TextEditingController();

//   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
//     onPrimary: Colors.black87,
//     primary: Colors.grey[300],
//     minimumSize: Size(88, 36),
//     padding: EdgeInsets.symmetric(horizontal: 16),
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(2)),
//     ),
//   );

//   File? image;
//   final _picker = ImagePicker();
//   bool showSpinner = false;

//   Future getImage() async {
//     final pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       setState(() {});
//     } else {
//       print('no image selected');
//     }
//   }

//   bool isLoading = true;
//   var password = TextEditingController();
//   final _MyBox = Hive.box('data');

//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: new Text('Are you sure?'),
//             content: new Text('Do you want to return to dashboard'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () =>
//                     Navigator.of(context).pop(false), //<-- SEE HERE
//                 child: new Text('No'),
//               ),
//               TextButton(
//                 onPressed: () =>
//                     Navigator.of(context).pop(true), // <-- SEE HERE
//                 child: new Text('Yes'),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => _onWillPop(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // SizedBox(
//             //   height: 18,
//             // ),
//             Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.green.shade50,
//                 shape: BoxShape.circle,
//               ),
//               child: Image.asset(
//                 'assets/images/kiitLogo.png',
//               ),
//             ),
//             SizedBox(
//               height: 24,
//             ),
//             Text(
//               'SET YOUR PASSWORD ',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "Review your Password and please confirm it",
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black38,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             // Text(
//             //   "PASSWORD RESET",
//             //   style: TextStyle(
//             //     fontSize: 20,
//             //     fontWeight: FontWeight.bold,
//             //     color: Colors.black,
//             //   ),
//             // ),
//             SizedBox(
//               height: 10,
//             ),
//             new ListTile(
//               leading: const Icon(Icons.password),
//               title: new TextField(
//                 decoration: new InputDecoration(
//                   hintText: "ENTER YOUR NEW PASSWORD",
//                 ),
//                 controller: password,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             new ListTile(
//               leading: const Icon(Icons.password_sharp),
//               title: new TextField(
//                 decoration: new InputDecoration(
//                   hintText: "CONFIRM YOUR NEW PASSWORD",
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // isLoading
//                 //     ? ElevatedButton(
//                 //         onPressed: () async {
//                 //           setState(() {
//                 //             isLoading = false;
//                 //           });
//                 //           await addData(password.text);
//                 //           setState(() {
//                 //             isLoading = true;
//                 //           });

//                 //           if (_MyBox.get("resetPassword") == "success") {
//                 //             Navigator.of(context).push(MaterialPageRoute(
//                 //                 builder: ((context) => MainScreenTwo())));
//                 //           }
//                 //         },
//                 //         child: Text("SUBMIT"))
//                 //     : Center(child: CircularProgressIndicator()),

//                 isLoading
//                     ? SizedBox(
//                         width: 165,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             setState(() {
//                               isLoading = false;
//                             });
//                             await addData(
//                               password.text,
//                             );
//                             setState(() {
//                               isLoading = true;
//                             });

//                             if (_MyBox.get("resetPassword") == "success") {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: ((context) => MainScreenTwo())));
//                             }
//                           },
//                           style: ButtonStyle(
//                             foregroundColor:
//                                 MaterialStateProperty.all<Color>(Colors.white),
//                             backgroundColor:
//                                 MaterialStateProperty.all<Color>(Colors.green),
//                             shape: MaterialStateProperty.all<
//                                 RoundedRectangleBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(24.0),
//                               ),
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Request OTP',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       )
//                     : Center(child: CircularProgressIndicator()),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<String> addData(
//   String password,
// ) async {
//   final _MyBox = Hive.box('data');
//   Map data = {"_id": _MyBox.get("id"), "password": "$password"};

//   var body = json.encode(data);
//   var response = await http.post(
//       Uri.parse("http://192.168.247.145:5000/api/user/edit"),
//       headers: {"Content-Type": "application/json"},
//       body: body);

//   print("RESPONSE CODE IS :- ${response.statusCode.toString()}");

//   if (response.statusCode == 200) {
//     _MyBox.put("resetPassword", "success");
//     return "true";
//   }

//   return "false";
// }

//   // Future<void> uploadImage() async {
//   //   setState(() {
//   //     showSpinner = true;
//   //   });

//   //   var stream = new http.ByteStream(image!.openRead());
//   //   stream.cast();

//   //   var length = await image!.length();

//   //   var uri = Uri.parse('https://fakestoreapi.com/products');

//   //   var request = new http.MultipartRequest('POST', uri);

//   //   request.fields['title'] = "Static title";

//   //   var multiport = new http.MultipartFile('image', stream, length);

//   //   request.files.add(multiport);

//   //   var response = await request.send();

//   //   print(response.stream.toString());
//   //   if (response.statusCode == 200) {
//   //     setState(() {
//   //       showSpinner = false;
//   //     });
//   //     print('image uploaded');
//   //   } else {
//   //     print('failed');
//   //     setState(() {
//   //       showSpinner = false;
//   //     });
//   //   }
//   // }

import 'dart:convert';
import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hrms/screens/main_screen/main_screen.dart';
import 'package:http/http.dart' as http;

import '../../../../logic/auth_bloc/auth_bloc.dart';
import '../../../../logic/auth_bloc/auth_event.dart';

class IPSettings extends StatefulWidget {
  const IPSettings({Key? key}) : super(key: key);

  @override
  _IPSettingsState createState() => _IPSettingsState();
}

class _IPSettingsState extends State<IPSettings> {
  var str1 = TextEditingController();
  var str2 = TextEditingController();
  bool passwordVisible = false;

  final _MyBox = Hive.box('data');
  bool isLoading = true;

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
                  "http://192.168.37.145:5000/images?username=${_MyBox.get('username')}&filename=pp"),
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
                  'URL Settings',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If App Not Working Contact Administrator And Change URL Here",
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textField(
                              first: true,
                              last: false,
                              controller: str1,
                              msg: "ENTER BASE URL"),
                          _textField(
                              first: true,
                              last: false,
                              controller: str2,
                              msg: "ENTER IMAGE URL"),
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
                                  await changeUrl(
                                    "${str1.text}",
                                  );

                                  if (_MyBox.get("urlChangeStatus") ==
                                      "false") {
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Something Went Wrong! Try Again'));

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }

                                  if (_MyBox.get("urlChangeStatus") == "true") {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  }
                                  final snackBar = SnackBar(
                                      content: Text(
                                          'Successfully Changed The Url! Try Again'));

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  setState(() {
                                    isLoading = true;
                                  });
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
                                    'Set URL',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          : Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(
      {bool? first,
      bool? last,
      TextEditingController? controller,
      String? msg}) {
    return Container(
      height: 60,
      width: 270,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          // obscureText: passwordVisible ? false : true,
          controller: controller,
          autofocus: true,
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            // suffixIcon: IconButton(
            //   icon: Icon(
            //       passwordVisible ? Icons.visibility : Icons.visibility_off),
            //   onPressed: () {
            //     setState(
            //       () {
            //         passwordVisible = !passwordVisible;
            //       },
            //     );
            //   },
            // ),
            hintText: msg,
            hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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

Future<String> changeUrl(String url) async {
  final _MyBox = Hive.box('data');

  if (url != "") {
    _MyBox.put("baseUrl", "$url");
    return "true";
  }
  // } else {
  //   _MyBox.put("passSameStatus", "true");
  //   // Map data = {"otp": "$otp", "username": "$username"};
  //   Map data = {"_id": _MyBox.get("id"), "password": "$str1"};
  //   var body = json.encode(data);
  //   // try {
  //   var response = await http.post(
  //       Uri.parse("http://10.7.216.72:5000/api/user/edit"),
  //       headers: {"Content-Type": "application/json"},
  //       body: body);
  //   //   print("response code is ${response.statusCode}");
  //   //   if (response.statusCode == 200) {
  //   //     _MyBox.put("otpVerifyStatus", "true");
  //   //     return "true";
  //   //   } else if (response.statusCode == 401) {
  //   //     _MyBox.put("otpVerifyStatus", "alreadyVerified");
  //   //   }
  //   // } on SocketException {
  //   //   print('No Internet connection 😑');
  //   //   _MyBox.put("otpSubmitStatus", "false");
  //   // } on HttpException {
  //   //   print("Couldn't find the post 😱");
  //   //   _MyBox.put("otpSubmitStatus", "false");
  //   // } on FormatException {
  //   //   print("Bad response format 👎");
  //   //   _MyBox.put("otpSubmitStatus", "false");
  //   // }

  //   if (response.statusCode == 200) {
  //     Map data1 = {"_id": _MyBox.get("id"), "password": "$str1"};
  //     var body1 = json.encode(data);
  //     // try {
  //     var userResponse = await http.get(
  //         Uri.parse("http://10.7.216.72:5000/api/app/user/"),
  //         headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

  //     if (userResponse.statusCode == 200) {
  //       var jsonDataUser = json.decode(userResponse.body);

  //       _MyBox.put("firstName", jsonDataUser['fname']);
  //       _MyBox.put("lastName", jsonDataUser['lname']);
  //       _MyBox.put('department', jsonDataUser['department']);
  //       _MyBox.put('username', jsonDataUser['username']);
  //       _MyBox.put('verifiedEmail', jsonDataUser['verified']);
  //       _MyBox.put('level', jsonDataUser['level']);
  //       _MyBox.put('email', jsonDataUser['email']);
  //       _MyBox.put('pass_reset', jsonDataUser['pass_reset']);
  //       _MyBox.put('id', jsonDataUser['_id']);
  //     }
  //   }

  //   if (response.statusCode == 200) {
  //     _MyBox.put("resetPassword", "success");
  //     return "true";
  //   }
  return "false";
}

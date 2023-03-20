// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hrms/screens/main_screen/nav_bar/Dashboard/resetPassword2.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hrms/logic/auth_bloc/auth_bloc.dart';
// import 'package:hrms/logic/auth_bloc/auth_event.dart';
// import 'package:hrms/logic/email_bloc/email_bloc.dart';

// class EmailVerify extends StatefulWidget {
//   EmailVerify({super.key});

//   @override
//   State<EmailVerify> createState() => _EmailVerifyState();
// }

// class _EmailVerifyState extends State<EmailVerify> {
//   final _MyBox = Hive.box('data');
//   bool isLoading = true;
//   bool isLoading1 = true;
//   var otpController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Image.asset(
//               "assets/emailLogo.png",
//               height: 200,
//               width: 200,
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Text(
//               "PLEASE VERIFY YOUR EMAIL",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "EMAIL :- ${_MyBox.get("email")}",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 50),
//             isLoading
//                 ? ElevatedButton(
//                     onPressed: () async {
//                       setState(() {
//                         isLoading = false;
//                       });
//                       await sendOTP(
//                         _MyBox.get('username'),
//                       );
//                       setState(() {
//                         isLoading = true;
//                       });
//                     },
//                     child: Text("Send OTP"))
//                 : Center(child: CircularProgressIndicator()),
//             new ListTile(
//               leading: const Icon(Icons.key),
//               title: new TextField(
//                 decoration: new InputDecoration(
//                   hintText: "Enter Your OTP",
//                 ),
//                 controller: otpController,
//               ),
//             ),
//             isLoading1
//                 ? ElevatedButton(
//                     onPressed: () async {
//                       setState(() {
//                         isLoading1 = false;
//                       });
//                       await verifyOTP(
//                         _MyBox.get('username'),
//                         otpController.text,
//                       );
//                       setState(() {
//                         isLoading1 = true;
//                       });
//                       if (_MyBox.get('otpVerifyStatus') == "true") {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: ((context) => ForgetPasswordTwo())));
//                       }
//                     },
//                     child: Text("VERIFY"))
//                 : Center(child: CircularProgressIndicator()),
//             // BlocBuilder<EmailBloc, EmailState>(
//             //   builder: (context, state) {
//             //     return Center(
//             //       child: state is EmailVerifiacationLoading
//             //           ? Text("hello")
//             //           : ElevatedButton(
//             //               onPressed: () async{
//             //                 await verifyOTP(otpController.text, _MyBox.get('username'),);
//             //                 isLoading
//             //                     ? ElevatedButton(
//             //                         onPressed: () async {
//             //                           setState(() {
//             //                             isLoading = false;
//             //                           });
//             //                           await sendOTP(
//             //                             _MyBox.get('username'),
//             //                           );
//             //                           setState(() {
//             //                             isLoading = true;
//             //                           });
//             //                         },
//             //                         child: Text("Send OTP"))
//             //                     : Center(child: CircularProgressIndicator());
//             //                 BlocProvider.of<EmailBloc>(context)
//             //                     .add(VerifyButtonPressed());
//             //                 showDialog(
//             //                   context: context,
//             //                   builder: (ctx) => AlertDialog(
//             //                     title: const Text(
//             //                       "EMAIL SEND SUCCESSFULLY",
//             //                       style: TextStyle(
//             //                         fontSize: 20,
//             //                         fontWeight: FontWeight.bold,
//             //                       ),
//             //                     ),
//             //                     content: const Text(
//             //                       "Please Login Again",
//             //                       style: TextStyle(
//             //                         fontSize: 18,
//             //                       ),
//             //                     ),
//             //                     actions: <Widget>[
//             //                       TextButton(
//             //                         onPressed: () {
//             //                           BlocProvider.of<AuthenticationBloc>(
//             //                                   context)
//             //                               .add(
//             //                             LoggedOut(),
//             //                           );
//             //                           Navigator.of(ctx).pop();
//             //                         },
//             //                         child: Center(
//             //                           child: Container(
//             //                             color: Colors.green,
//             //                             padding: const EdgeInsets.all(14),
//             //                             child: const Text(
//             //                               "lOGOUT",
//             //                               style: TextStyle(
//             //                                 color: Colors.white,
//             //                               ),
//             //                             ),
//             //                           ),
//             //                         ),
//             //                       ),
//             //                     ],
//             //                   ),
//             //                 );
//             //               },
//             //               child: Text(
//             //                 "VERIFY",
//             //               ),
//             //               style:
//             //                   ElevatedButton.styleFrom(primary: Colors.green),
//             //             ),
//             //     );
//             //   },
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<String> sendOTP(
//   String userName,
// ) async {
//   final _MyBox = Hive.box('data');
//   Map data = {
//     "username": "$userName",
//   };
//   var body = json.encode(data);
//   // var response = await http.post(
//   //     Uri.parse("http://10.7.12.230:5000/api/kiss/adddata"),
//   //     headers: {"Content-Type": "application/json"},
//   //     body: body);

//   try {
//     var response = await http.post(
//         Uri.parse("http://192.168.37.145:5000/api/auth/generate_otp"),
//         headers: {"Content-Type": "application/json"},
//         body: body);
//     print("response code is ${response.statusCode}");
//     if (response.statusCode == 200) {
//       _MyBox.put("otpSubmitStatus", "true");
//       return "true";
//     } else if (response.statusCode == 401) {
//       _MyBox.put("otpSubmitStatus", "alreadyVerified");
//     }
//   } on SocketException {
//     print('No Internet connection 😑');
//     _MyBox.put("otpSubmitStatus", "false");
//   } on HttpException {
//     print("Couldn't find the post 😱");
//     _MyBox.put("otpSubmitStatus", "false");
//   } on FormatException {
//     print("Bad response format 👎");
//     _MyBox.put("otpSubmitStatus", "false");
//   }

// //401 -> user verified
// //200 -> email send
// //404 -> user invalid
//   // print("RESPONSE CODE IS :- ${response.statusCode.toString()}");

//   // if (response.statusCode == 201) {
//   //   _MyBox.put("kissSubmitStatus", "true");
//   //   return "true";
//   // } else {
//   //   print("mai false hu");
//   //   _MyBox.put("kissSubmitStatus", "false");
//   // }
//   return "false";
// }

// Future<String> verifyOTP(
//   String username,
//   String otp,
// ) async {
//   final _MyBox = Hive.box('data');
//   Map data = {"otp": "$otp", "username": "$username"};
//   var body = json.encode(data);
//   // var response = await http.post(
//   //     Uri.parse("http://10.7.12.230:5000/api/kiss/adddata"),
//   //     headers: {"Content-Type": "application/json"},
//   //     body: body);

//   try {
//     var response = await http.post(
//         Uri.parse("http://192.168.37.145:5000/api/auth/verify_user"),
//         headers: {"Content-Type": "application/json"},
//         body: body);
//     print("response code is ${response.statusCode}");
//     if (response.statusCode == 200) {
//       _MyBox.put("otpVerifyStatus", "true");
//       return "true";
//     } else if (response.statusCode == 401) {
//       _MyBox.put("otpVerifyStatus", "alreadyVerified");
//     }
//   } on SocketException {
//     print('No Internet connection 😑');
//     _MyBox.put("otpSubmitStatus", "false");
//   } on HttpException {
//     print("Couldn't find the post 😱");
//     _MyBox.put("otpSubmitStatus", "false");
//   } on FormatException {
//     print("Bad response format 👎");
//     _MyBox.put("otpSubmitStatus", "false");
//   }

// //401 -> user verified
// //200 -> email send
// //404 -> user invalid
//   // print("RESPONSE CODE IS :- ${response.statusCode.toString()}");

//   // if (response.statusCode == 201) {
//   //   _MyBox.put("kissSubmitStatus", "true");
//   //   return "true";
//   // } else {
//   //   print("mai false hu");
//   //   _MyBox.put("kissSubmitStatus", "false");
//   // }
//   return "false";
// }

// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hrms/screens/main_screen/nav_bar/Dashboard/resetPassword2.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hrms/logic/auth_bloc/auth_bloc.dart';
// import 'package:hrms/logic/auth_bloc/auth_event.dart';
// import 'package:hrms/logic/email_bloc/email_bloc.dart';

// class EmailVerify extends StatefulWidget {
//   EmailVerify({super.key});

//   @override
//   State<EmailVerify> createState() => _EmailVerifyState();
// }

// class _EmailVerifyState extends State<EmailVerify> {
//   final _MyBox = Hive.box('data');
//   bool isLoading = true;
//   bool isLoading1 = true;
//   var otpController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Image.asset(
//               "assets/emailLogo.png",
//               height: 200,
//               width: 200,
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             Text(
//               "PLEASE VERIFY YOUR EMAIL",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "EMAIL :- ${_MyBox.get("email")}",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 50),
//             isLoading
//                 ? ElevatedButton(
//                     onPressed: () async {
//                       setState(() {
//                         isLoading = false;
//                       });
//                       await sendOTP(
//                         _MyBox.get('username'),
//                       );
//                       setState(() {
//                         isLoading = true;
//                       });
//                     },
//                     child: Text("Send OTP"))
//                 : Center(child: CircularProgressIndicator()),
//             // new ListTile(
//             //   leading: const Icon(Icons.key),
//             //   title: new TextField(
//             //     decoration: new InputDecoration(
//             //       hintText: "Enter Your OTP",
//             //     ),
//             //     controller: otpController,
//             //   ),
//             // ),
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
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<String> sendOTP(
//   String userName,
// ) async {
//   final _MyBox = Hive.box('data');
//   Map data = {
//     "username": "$userName",
//   };
//   var body = json.encode(data);

//   try {
//     var response = await http.post(
//         Uri.parse("http://192.168.37.145:5000/api/auth/generate_otp"),
//         headers: {"Content-Type": "application/json"},
//         body: body);
//     print("response code is ${response.statusCode}");
//     if (response.statusCode == 200) {
//       _MyBox.put("otpSubmitStatus", "true");
//       return "true";
//     } else if (response.statusCode == 401) {
//       _MyBox.put("otpSubmitStatus", "alreadyVerified");
//     }
//   } on SocketException {
//     print('No Internet connection 😑');
//     _MyBox.put("otpSubmitStatus", "false");
//   } on HttpException {
//     print("Couldn't find the post 😱");
//     _MyBox.put("otpSubmitStatus", "false");
//   } on FormatException {
//     print("Bad response format 👎");
//     _MyBox.put("otpSubmitStatus", "false");
//   }

//   return "false";
// }

// Future<String> verifyOTP(
//   String username,
//   String otp,
// ) async {
//   final _MyBox = Hive.box('data');
//   Map data = {"otp": "$otp", "username": "$username"};
//   var body = json.encode(data);
//   try {
//     var response = await http.post(
//         Uri.parse("http://192.168.37.145:5000/api/auth/verify_user"),
//         headers: {"Content-Type": "application/json"},
//         body: body);
//     print("response code is ${response.statusCode}");
//     if (response.statusCode == 200) {
//       _MyBox.put("otpVerifyStatus", "true");
//       return "true";
//     } else if (response.statusCode == 401) {
//       _MyBox.put("otpVerifyStatus", "alreadyVerified");
//     }
//   } on SocketException {
//     print('No Internet connection 😑');
//     _MyBox.put("otpSubmitStatus", "false");
//   } on HttpException {
//     print("Couldn't find the post 😱");
//     _MyBox.put("otpSubmitStatus", "false");
//   } on FormatException {
//     print("Bad response format 👎");
//     _MyBox.put("otpSubmitStatus", "false");
//   }

//   return "false";
//}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hrms/screens/main_screen/otp_verify_page.dart';
import 'package:http/http.dart' as http;

import '../../logic/auth_bloc/auth_bloc.dart';
import '../../logic/auth_bloc/auth_event.dart';

// import 'otp.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final _MyBox = Hive.box('data');
  bool isLoading = true;
  var email = TextEditingController();

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

  Widget build(BuildContext context) {
    email.text = "${_MyBox.get("email")}";
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: GestureDetector(
                //     onTap: () => Navigator.pop(context),
                //     child: Icon(
                //       Icons.arrow_back,
                //       size: 32,
                //       color: Colors.black54,
                //     ),
                //   ),
                // ),
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
                  'Registration',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Review your email. we'll send you a verification code so we know you're real",
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
                      TextFormField(
                        showCursor: false,
                        readOnly: true,
                        controller: email,
                        // keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),

                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 32,
                          ),
                        ),
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
                                  await sendOTP(
                                    _MyBox.get('username'),
                                  );

                                  setState(() {
                                    isLoading = true;
                                  });

                                  if (_MyBox.get("otpSubmitStatus") ==
                                      "false") {
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Something Went Wrong! Try Again'));

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  if (_MyBox.get("otpSubmitStatus") == "true") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) => (Otp()))));
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
                                    'Request OTP',
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
}

Future<String> sendOTP(
  String userName,
) async {
  final _MyBox = Hive.box('data');
  Map data = {
    "username": "$userName",
  };
  var body = json.encode(data);

  try {
    var response = await http.post(
        Uri.parse("http://${_MyBox.get("baseUrl")}:5000/api/auth/generate_otp"),
        headers: {"Content-Type": "application/json"},
        body: body);
    print("response code is kjgkygk ${response.statusCode}");
    if (response.statusCode == 200) {
      _MyBox.put("otpSubmitStatus", "true");
      return "true";
    } else if (response.statusCode == 401) {
      _MyBox.put("otpSubmitStatus", "alreadyVerified");
    }
  } on SocketException {
    print('No Internet connection 😑');
    _MyBox.put("otpSubmitStatus", "false");
  } on HttpException {
    print("Couldn't find the post 😱");
    _MyBox.put("otpSubmitStatus", "false");
  } on FormatException {
    print("Bad response format 👎");
    _MyBox.put("otpSubmitStatus", "false");
  }

  return "false";
}

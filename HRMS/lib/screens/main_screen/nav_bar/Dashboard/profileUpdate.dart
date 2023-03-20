// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hrms/screens/model/user.dart';
// import 'package:hrms/screens/utils/user_preferences.dart';
// import 'package:hrms/screens/widget/appbar_widget.dart';
// import 'package:hrms/screens/widget/profile_widget.dart';
// import 'package:hrms/screens/widget/textfield_widget.dart';

// class EditProfileDetailPage extends StatefulWidget {
//   @override
//   _EditProfileDetailPageState createState() => _EditProfileDetailPageState();
// }

// class _EditProfileDetailPageState extends State<EditProfileDetailPage> {
//   // User user = UserPreferences.myUser;
//   var fName = TextEditingController(text: "Sample");
//   final lName = TextEditingController(text: "name");
//   final email = TextEditingController(text: "test@gmail.com");
//   final username = TextEditingController(text: "Hello");
//   final department = TextEditingController(text: "Hello");
//   final mobile = TextEditingController(text: "Hello");
//   final address = TextEditingController(text: "Hello");
//   final level = TextEditingController(text: "Hello");

//   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
//     onPrimary: Colors.black87,
//     primary: Colors.grey[300],
//     minimumSize: Size(88, 36),
//     padding: EdgeInsets.symmetric(horizontal: 16),
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(2)),
//     ),
//   );
//   final _MyBox = Hive.box('data');

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: ListView(
//           padding: EdgeInsets.symmetric(horizontal: 32),
//           physics: BouncingScrollPhysics(),
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "First Name",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   // style: TextStyle(color: Colors.green)
//                   // ,

//                   controller: fName,

//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "${_MyBox.get("firstName")}",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   // style: TextStyle(color: Colors.green)
//                   // ,

//                   controller: fName,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "First Name",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   // style: TextStyle(color: Colors.green)
//                   // ,

//                   controller: fName,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "${_MyBox.get("firstName")}",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   // style: TextStyle(color: Colors.green)
//                   // ,

//                   controller: fName,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "${_MyBox.get("firstName")}",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   // style: TextStyle(color: Colors.green)
//                   // ,

//                   controller: fName,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "${_MyBox.get("firstName")}",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   // style: TextStyle(color: Colors.green)
//                   // ,

//                   controller: fName,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "${_MyBox.get("firstName")}",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 const SizedBox(height: 8),
//                 TextField(
//                   // style: TextStyle(color: Colors.green)
//                   // ,

//                   controller: fName,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(width: 3, color: Colors.green),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // const SizedBox(height: 9),
//             // TextFieldWidget(
//             //   label: 'Last Name',
//             //   text: "Choudhary",
//             //   onChanged: (email) {},
//             // ),
//             // const SizedBox(height: 9),
//             // TextFieldWidget(
//             //   label: 'Email',
//             //   text: "aditya@gmail.com",
//             //   onChanged: (email) {},
//             // ),
//             // const SizedBox(height: 9),
//             // TextFieldWidget(
//             //   label: 'username',
//             //   text: "aditya69",
//             //   onChanged: (name) {},
//             // ),
//             // const SizedBox(height: 9),
//             // TextFieldWidget(
//             //   label: 'department',
//             //   text: "cse",
//             //   onChanged: (email) {},
//             // ),
//             // const SizedBox(height: 9),
//             // TextFieldWidget(
//             //   label: 'Mobile',
//             //   text: "9091165390",
//             //   onChanged: (name) {},
//             // ),
//             // const SizedBox(height: 9),
//             // TextFieldWidget(
//             //   label: 'Address',
//             //   text: "Bhunaneswar, Oddisha",
//             //   onChanged: (email) {},
//             // ),
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   print(fName.text);
//                 },
//                 style: ButtonStyle(
//                   foregroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.green),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(24.0),
//                     ),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text(
//                     'Update',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
// }

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class EditProfileDetailPage extends StatefulWidget {
  const EditProfileDetailPage({super.key});

  @override
  State<EditProfileDetailPage> createState() => _EditProfileDetailPageState();
}

class _EditProfileDetailPageState extends State<EditProfileDetailPage> {
  var fName = TextEditingController();
  final lName = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final department = TextEditingController();
  final mobile = TextEditingController();
  final address = TextEditingController();
  final level = TextEditingController();

  final _MyBox = Hive.box('data');
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    // mobile.text = "9091165390";
    // address.text = "Bhubaneswar, Orissa";
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "First Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: fName,
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "${_MyBox.get("firstName")}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Last Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                // style: TextStyle(color: Colors.green)
                // ,

                controller: lName,
                decoration: InputDecoration(
                  hintText: "${_MyBox.get("lastName")}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "UserName",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                // style: TextStyle(color: Colors.green)
                // ,

                controller: username,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "${_MyBox.get("username")}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                // style: TextStyle(color: Colors.green)
                // ,

                controller: email,
                decoration: InputDecoration(
                  hintText: "${_MyBox.get("email")}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Department",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                // style: TextStyle(color: Colors.green)
                // ,

                controller: department,
                decoration: InputDecoration(
                  hintText: "${_MyBox.get("department")}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mobile No",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                // style: TextStyle(color: Colors.green)
                // ,

                controller: mobile,
                decoration: InputDecoration(
                  hintText: "${_MyBox.get("mobile")}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              TextField(
                // style: TextStyle(color: Colors.green)
                // ,

                controller: address,
                decoration: InputDecoration(
                  hintText: "${_MyBox.get("address")}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          isLoading
              ? SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = false;
                      });
                      await updateProfile(
                        "${fName.text}",
                        "${lName.text}",
                        "${username.text}",
                        "${email.text}",
                        "${department.text}",
                        "${mobile.text}",
                        "${address.text}",
                      );
                      setState(() {
                        isLoading = true;
                      });
                      if (_MyBox.get('profileUpdateStatus') == "false") {
                        final snackBar = SnackBar(
                            content: Text('Something Went Wrong! Try Again'));

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (_MyBox.get('otpVerifyStatus') == "true") {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: ((context) => ForgetPasswordTwo())));
                        Navigator.of(context).pop();
                      }
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Update',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

Future<String> updateProfile(
  String fname,
  String lname,
  String username,
  String email,
  String department,
  String mobile,
  String address,
) async {
  final _MyBox = Hive.box('data');
  if (fname == "" &&
      lname == "" &&
      username == "" &&
      email == "" &&
      department == "" &&
      mobile == "" &&
      address == "") {
    _MyBox.put("profileUpdateStatus", "false");
    return "false";
  }

  Map data = {
    "fname": "${fname == "" ? _MyBox.get("firstName") : fname}",
    "lname": "${lname == "" ? _MyBox.get("lastName") : lname}",
    "department": "${department == "" ? _MyBox.get("department") : department}",
    "username": "${username == "" ? _MyBox.get("username") : username}",
    "email": "${email == "" ? _MyBox.get("email") : email}",
    "mobile": "${mobile == "" ? _MyBox.get("mobile") : mobile}",
    "address": "${address == "" ? _MyBox.get("address") : address}",
  };

  var body = json.encode(data);
  try {
    var response = await http.post(
        Uri.parse("http://${_MyBox.get("baseUrl")}:5000/api/user/edit/"),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${_MyBox.get('token')}'
        },
        body: body);
    print("response code is PROFILE UPDATE IS :- ${response.statusCode}");
    if (response.statusCode == 200) {
      print(
          "THE NAME IS :-  ${fname == "" ? _MyBox.get("firstName") : fname} AND STATUS CODE IS :- ${response.statusCode.toString()}");
      _MyBox.put("profileUpdateStatus", "true");
      if (response.statusCode == 200) {
        // Map data1 = {"_id": _MyBox.get("id"), "password": "$str1"};
        var body1 = json.encode(data);
        // try {
        var userResponse = await http.get(
            Uri.parse("http://${_MyBox.get("baseUrl")}:5000/api/app/user/"),
            headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

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
          _MyBox.put('id', jsonDataUser['_id']);
        }
      }
      return "true";
    }
    if (response.statusCode == 401) {
      _MyBox.put("profileUpdateStatus", "false");
    }
  } on SocketException {
    print('No Internet connection 😑');
    _MyBox.put("profileUpdateStatus", "false");
  } on HttpException {
    print("Couldn't find the post 😱");
    _MyBox.put("profileUpdateStatus", "false");
  } on FormatException {
    print("Bad response format 👎");
    _MyBox.put("profileUpdateStatus", "false");
  }

  return "false";
}

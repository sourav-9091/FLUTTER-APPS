import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:hive/hive.dart';
import 'package:hrms/screens/main_screen/main_screen.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String dropdownvalue = 'Relative';
  final List<String> items = [
    'CHILD OF A FRIEND',
    'CHILD\'S RELATIVE',
    'OTHERS',
  ];
  String? selectedValue;

  String dropdownvalue1 = 'Department';
  final List<String> items1 = [
    'ITI',
    'ENGINEERING',
    'POLYTECHNIC',
  ];
  String? selectedValue1;

  final add_ref_no = TextEditingController();
  final name = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final amt_paid = TextEditingController();
  final contact_no = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  bool isLoading = true;
  var password = TextEditingController();
  final _MyBox = Hive.box('data');

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to return to dashboard'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
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
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Text(
              "PASSWORD RESET",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new ListTile(
              leading: const Icon(Icons.password),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "ENTER YOUR NEW PASSWORD",
                ),
                controller: password,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            new ListTile(
              leading: const Icon(Icons.password_sharp),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "CONFIRM YOUR NEW PASSWORD",
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                isLoading
                    ? ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = false;
                          });
                          await addData(password.text);
                          setState(() {
                            isLoading = true;
                          });

                          if (_MyBox.get("resetPassword") == "success") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => HomeScreen())));
                          }
                        },
                        child: Text("SUBMIT"))
                    : Center(child: CircularProgressIndicator()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<String> addData(
  String password,
) async {
  final _MyBox = Hive.box('data');
  Map data = {"_id": _MyBox.get("id"), "password": "$password"};

  var body = json.encode(data);
  var response = await http.post(
      Uri.parse("http://192.168.37.145:5000/api/user/edit"),
      headers: {"Content-Type": "application/json"},
      body: body);

  print("RESPONSE CODE IS :- ${response.statusCode.toString()}");

  if (response.statusCode == 200) {
    _MyBox.put("resetPassword", "success");
    return "true";
  }

  return "false";
}


  // Future<void> uploadImage() async {
  //   setState(() {
  //     showSpinner = true;
  //   });

  //   var stream = new http.ByteStream(image!.openRead());
  //   stream.cast();

  //   var length = await image!.length();

  //   var uri = Uri.parse('https://fakestoreapi.com/products');

  //   var request = new http.MultipartRequest('POST', uri);

  //   request.fields['title'] = "Static title";

  //   var multiport = new http.MultipartFile('image', stream, length);

  //   request.files.add(multiport);

  //   var response = await request.send();

  //   print(response.stream.toString());
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       showSpinner = false;
  //     });
  //     print('image uploaded');
  //   } else {
  //     print('failed');
  //     setState(() {
  //       showSpinner = false;
  //     });
  //   }
  // }
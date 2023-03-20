import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class KIIT extends StatefulWidget {
  const KIIT({super.key});

  @override
  State<KIIT> createState() => _KIITState();
}

class _KIITState extends State<KIIT> {
  String relationDropDown = 'CHILD OF A FRIEND';
  final List<String> items = [
    'CHILD OF A FRIEND',
    'CHILD\'S RELATIVE',
    'OTHERS',
  ];
  String? selectedValue;

  String departmentDropDown = 'ITI';
  final List<String> items1 = [
    'ITI',
    'ENGINEERING',
    'POLYTECHNIC',
  ];
  String? selectedValue1;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  Future getImage() async {
    try {
      final pickedFile =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

      if (pickedFile != null) {
        XFile? image = XFile(pickedFile.path);
        imageFileList!.add(image);
        setState(() {});
      } else {
        print('no image selected');
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('SELECT IMAGE SOURCE'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // getImage(ImageSource.gallery);
                      selectImages();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: const [
                          Icon(Icons.image),
                          SizedBox(
                            width: 6,
                          ),
                          Text('From Gallery'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: const [
                          Icon(Icons.camera),
                          SizedBox(
                            width: 6,
                          ),
                          Text('From Camera'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  final ref_no = TextEditingController();
  final name = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final pin = TextEditingController();
  final relation = TextEditingController();
  final department = TextEditingController();
  final amt_paid = TextEditingController();
  final contact_no = TextEditingController();
  final email = TextEditingController();

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

  bool isLoading = true;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to return to dashboard'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: const Text('Yes'),
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "ADMISSION REFERENCE NO",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: ref_no,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "NAME",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: name,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.map, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "PIN CODE",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: pin,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.map, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "CITY",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: city,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.map, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "STATE",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: state,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 12),
                      DropdownButton<String>(
                        underline: Container(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        elevation: 0,
                        focusColor: Colors.white,
                        value: relationDropDown,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items:
                            items.map<DropdownMenuItem<String>>((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(
                              val,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          );
                        }).toList(),
                        hint: const Text(
                          "SELETE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        onChanged: ((String? value) {
                          setState(() {
                            relationDropDown = value!;
                          });
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 12),
                      DropdownButton<String>(
                        underline: Container(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        elevation: 0,
                        focusColor: Colors.white,
                        value: departmentDropDown,
                        // alignment: Alignment.centerLeft,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: items1
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.left),
                          );
                        }).toList(),
                        hint: const Text(
                          "SELETE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        onChanged: ((String? value) {
                          setState(() {
                            departmentDropDown = value!;
                          });
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.money, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "AMOUNT PAID",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: amt_paid,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "CONTACT DETAIL",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: contact_no,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "EMAIL OF STUDENT",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: email,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 17, 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: (() {
                            selectImages();
                          }),
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              height: 120,
                              width: 354,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: imageFileList!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onDoubleTap: () {
                                        setState(() {
                                          imageFileList!.removeAt(index);
                                        });
                                      },
                                      child: Image.file(
                                          File(imageFileList![index].path),
                                          fit: BoxFit.cover),
                                    );
                                  })),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () async {
                              myAlert();
                            },
                            child: Row(
                              children: const [
                                SizedBox(
                                  width: 24,
                                ),
                                Text(
                                  "PICK AN IMAGE",
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 24,
                                ),
                              ],
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        isLoading
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  
                                  await addData(
                                    ref_no.text,
                                    name.text,
                                    pin.text,
                                    city.text,
                                    state.text,
                                    relationDropDown,
                                    departmentDropDown,
                                    amt_paid.text,
                                    contact_no.text,
                                    email.text,
                                    context,
                                  );
                                  setState(() {
                                    isLoading = true;
                                  });
                                },
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "SUBMIT",
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                  ],
                                ))
                            : Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> addData(
  String add_ref,
  String name,
  String pin,
  String city,
  String state,
  String relation,
  String department,
  String amt_paid,
  String number,
  String email,
  BuildContext ctx,
) async {
  final _MyBox = Hive.box('data');
  if (add_ref == "" ||
      name == "" ||
      pin == "" ||
      city == "" ||
      state == "" ||
      relation == "" ||
      department == "" ||
      amt_paid == "" ||
      number == "" ||
      email == "") {
    _MyBox.put("kiitSubmitStatus", "false");
    return "false";
  }
  Map data = {
    "adm_ref_no": "$add_ref",
    "student_name": "$name",
    "pincode": "$pin",
    "city": "$city",
    "student_address": "kiit university",
    "state": "$state",
    "student_rel": "$relation",
    "student_dep": "$department",
    "amount_by_candidate": "$amt_paid",
    "student_ph": "$number",
    "student_email": "$email"
  };
  var body = json.encode(data);
  try {
    var response = await http.post(
        Uri.parse("http://10.7.214.31:5000/api/kiit/adddata"),
        headers: {"Content-Type": "application/json"},
        body: body);
    if (response.statusCode == 201) {
      _MyBox.put("kiitSubmitStatus", "true");
      return "true";
    } else {
      throw HttpException('${response.statusCode}');
    }
  } on SocketException {
    print('No Internet connection 😑');
    _MyBox.put("kiitSubmitStatus", "false");
  } on HttpException {
    print("Couldn't find the post 😱");
    _MyBox.put("kiitSubmitStatus", "false");
  } on FormatException {
    print("Bad response format 👎");
    _MyBox.put("kiitSubmitStatus", "false");
  }
  return "false";
}

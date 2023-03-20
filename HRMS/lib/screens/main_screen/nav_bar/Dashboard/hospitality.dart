import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class HOSPITALITY extends StatefulWidget {
  const HOSPITALITY({super.key});

  @override
  State<HOSPITALITY> createState() => _HOSPITALITYState();
}

class _HOSPITALITYState extends State<HOSPITALITY> {
  String serviceDropDown = 'FOOD';
  final List<String> items = [
    'FOOD',
    'HOTEL',
    'PARTY BOOKING',
    'BIRTHDAY CELEBRATION',
  ];

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

  final date = TextEditingController();
  final service = TextEditingController();
  final amt_paid = TextEditingController();

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
              Container(
                height: 90,
                width: 800,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child: TextField(
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);

                            setState(() {
                              date.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        decoration: const InputDecoration(
                          prefixIcon:
                              Icon(Icons.calendar_today, color: Colors.black),
                          border: InputBorder.none,
                          labelText: "DATE OF SERVICE AVAILED",
                          hintStyle: TextStyle(color: Colors.black),
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        controller: date,
                      ),
                    ),
                  ),
                ),
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
                        value: serviceDropDown,
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
                            serviceDropDown = value!;
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
                                    date.text,
                                    serviceDropDown,
                                    amt_paid.text,
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
  String dateOfPurchase,
  String serviceName,
  String amt_paid,
) async {
  final _MyBox = Hive.box('data');
  if (dateOfPurchase == "" ||
      serviceName == "" ||
      amt_paid == "") {
    _MyBox.put("kissSubmitStatus", "false");
    return "false";
  }
  Map data = {
    "product_name": "",
    "pid": "12",
    "eid": "hemang",
    "pquantity": "",
    "pprice": ""
  };
  var body = json.encode(data);
  try {
    var response = await http.post(
        Uri.parse("http://10.7.212.230:5000/api/kiss/adddata"),
        headers: {"Content-Type": "application/json"},
        body: body);
    if (response.statusCode == 201) {
      _MyBox.put("kissSubmitStatus", "true");
      return "true";
    } else {
      throw HttpException('${response.statusCode}');
    }
  } on SocketException {
    print('No Internet connection 😑');
    _MyBox.put("kissSubmitStatus", "false");
  } on HttpException {
    print("Couldn't find the post 😱");
    _MyBox.put("kissSubmitStatus", "false");
  } on FormatException {
    print("Bad response format 👎");
    _MyBox.put("kissSubmitStatus", "false");
  }
  return "false";
}

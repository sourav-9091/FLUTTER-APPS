// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';

// class TEMPLE extends StatefulWidget {
//   const TEMPLE({super.key});

//   @override
//   State<TEMPLE> createState() => _TEMPLEState();
// }

// class _TEMPLEState extends State<TEMPLE> {
//   TextEditingController dateController = TextEditingController();

//   String dropdownvalue = 'Relative';
//   final List<String> items = [
//     'PRASAD',
//     'PLACE BOOKING',
//     'DONATION',
//   ];
//   String? selectedValue;

//   File? image;
//   final _picker = ImagePicker();
//   bool showSpinner = false;
//   bool isLoading = true;

//   Future getImage() async {
//     final pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

//     if (pickedFile != null) {
//       image = File(pickedFile.path);
//       setState(() {});
//     } else {
//       print('NO IMAGE SELECTED');
//     }
//   }

//   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
//     onPrimary: Colors.black87,
//     primary: Colors.grey[300],
//     minimumSize: Size(88, 36),
//     padding: EdgeInsets.symmetric(horizontal: 16),
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(2)),
//     ),
//   );

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
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Text(
//                 "ENTER DETAIL",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                   height: 80,
//                   child: Center(
//                       child: TextField(
//                     controller: dateController,
//                     decoration: const InputDecoration(
//                         icon: Icon(Icons.calendar_today),
//                         labelText: "DATE OF SERVICE AVAILED"),
//                     readOnly: true,
//                     onTap: () async {
//                       DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2101));

//                       if (pickedDate != null) {
//                         print(pickedDate);
//                         String formattedDate =
//                             DateFormat('yyyy-MM-dd').format(pickedDate);
//                         print(formattedDate);

//                         setState(() {
//                           dateController.text = formattedDate;
//                         });
//                       } else {
//                         print("Date is not selected");
//                       }
//                     },
//                   ))),
//               new ListTile(
//                 leading: const Icon(Icons.person),
//                 title: new TextField(
//                   decoration: new InputDecoration(
//                     hintText: "PRODUCT",
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton2(
//                     isExpanded: true,
//                     hint: Row(
//                       children: const [
//                         SizedBox(
//                           width: 4,
//                         ),
//                         Expanded(
//                           child: Text(
//                             'SELECT TEMPLE SERVICE',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                     items: items
//                         .map((item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(
//                                 item,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ))
//                         .toList(),
//                     value: selectedValue,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedValue = value as String;
//                       });
//                     },
//                     icon: const Icon(
//                       Icons.arrow_forward_ios_outlined,
//                     ),
//                     iconSize: 14,
//                     iconEnabledColor: Colors.black,
//                     iconDisabledColor: Color.fromARGB(255, 224, 224, 224),
//                     buttonHeight: 50,
//                     buttonWidth: 350,
//                     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
//                     buttonDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: Color.fromARGB(255, 224, 224, 224),
//                     ),
//                     buttonElevation: 2,
//                     itemHeight: 40,
//                     itemPadding: const EdgeInsets.only(left: 14, right: 14),
//                     dropdownMaxHeight: 200,
//                     dropdownWidth: 200,
//                     dropdownPadding: null,
//                     dropdownDecoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: Color.fromARGB(255, 224, 224, 224),
//                     ),
//                     dropdownElevation: 8,
//                     scrollbarRadius: const Radius.circular(40),
//                     scrollbarThickness: 6,
//                     scrollbarAlwaysShow: true,
//                     offset: const Offset(-20, 0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               new ListTile(
//                 leading: const Icon(Icons.money),
//                 title: new TextField(
//                   keyboardType: TextInputType.number,
//                   decoration: new InputDecoration(
//                     hintText: "TOTAL PRICE",
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 GestureDetector(
//                   onTap: () {
//                     getImage();
//                   },
//                   child: Container(
//                     child: image == null
//                         ? Center(
//                             child: Text('No Image'),
//                           )
//                         : Container(
//                             child: Center(
//                               child: Image.file(
//                                 File(image!.path).absolute,
//                                 height: 100,
//                                 width: 100,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Column(
//                   children: [
//                     ElevatedButton(
//                       style: raisedButtonStyle,
//                       onPressed: () {
//                         getImage();
//                       },
//                       child: Text(
//                         'UPLOAD IMAGE',
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     isLoading
//                         ? ElevatedButton(
//                             onPressed: () async {
//                               setState(() {
//                                 isLoading = false;
//                               });
//                               await addData("", "", "", "");
//                               setState(() {
//                                 isLoading = true;
//                               });
//                             },
//                             child: Text("SUBMIT"))
//                         : Center(child: CircularProgressIndicator()),
//                   ],
//                 )
//               ]),
//             ],
//           ),
//         ),
//       ),
//     );
//     ;
//   }
// }

// // Future<String> addData(
// //   String dateOfPurchase,
// //   String productName,
// //   String noOfProduct,
// //   String totalprice,
// // ) async {
// //   print("PRODUCT NAME IS :- ${productName.toString()}");
// //   Map data = {
// //     "product_name": "${productName.toString()}",
// //     "pid": "123445",
// //     "eid": "4353",
// //     "pquantity": "${noOfProduct.toString()}",
// //     "pprice": "${totalprice.toString()}"
// //   };
// //   var body = json.encode(data);
// //   var response = await http.post(
// //       Uri.parse("http://192.168.33.145:5000/app/kiss/adddata"),
// //       headers: {"Content-Type": "application/json"},
// //       body: body);

// //   print("RESPONSE CODE IS :- ${response.statusCode.toString()}");

// //   if (response.statusCode == 201) {
// //     return "true";
// //   }

// //   return "false";
// // }

// Future<String> addData(
//   String dateOfPurchase,
//   String productName,
//   String noOfProduct,
//   String totalprice,
// ) async {
//   final _MyBox = Hive.box('data');
//   if (dateOfPurchase == "" ||
//       productName == "" ||
//       noOfProduct == "" ||
//       totalprice == "") {
//     _MyBox.put("kissSubmitStatus", "false");
//     return "false";
//   }
//   Map data = {
//     "product_name": "$productName",
//     "pid": "12",
//     "eid": "hemang",
//     "pquantity": "$noOfProduct",
//     "pprice": "$totalprice"
//   };
//   var body = json.encode(data);
//   // var response = await http.post(
//   //     Uri.parse("http://10.7.12.230:5000/api/kiss/adddata"),
//   //     headers: {"Content-Type": "application/json"},
//   //     body: body);

//   try {
//     var response = await http.post(
//         Uri.parse("http://10.7.212.230:5000/api/kiss/adddata"),
//         headers: {"Content-Type": "application/json"},
//         body: body);
//     if (response.statusCode == 201) {
//       // throw HttpException('${response.statusCode}');
//       _MyBox.put("kissSubmitStatus", "true");
//       return "true";
//     } else {
//       throw HttpException('${response.statusCode}');
//     }
//   } on SocketException {
//     print('No Internet connection 😑');
//     _MyBox.put("kissSubmitStatus", "false");
//   } on HttpException {
//     print("Couldn't find the post 😱");
//     _MyBox.put("kissSubmitStatus", "false");
//   } on FormatException {
//     print("Bad response format 👎");
//     _MyBox.put("kissSubmitStatus", "false");
//   }

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



import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class TEMPLE extends StatefulWidget {
  const TEMPLE({super.key});

  @override
  State<TEMPLE> createState() => _TEMPLEState();
}

class _TEMPLEState extends State<TEMPLE> {
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

  final add_ref_no = TextEditingController();
  final name = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final amt_paid = TextEditingController();
  final contact_no = TextEditingController();
  final dateController = TextEditingController();

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
                              dateController.text = formattedDate;
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
                        controller: dateController,
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              //   child: Container(
              //     padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         border: Border.all(color: Colors.black)),
              //     child: TextField(
              //       decoration: const InputDecoration(
              //         prefixIcon: Icon(Icons.person, color: Colors.black),
              //         border: InputBorder.none,
              //         labelText: "NAME",
              //         hintStyle: TextStyle(color: Colors.black),
              //         labelStyle: TextStyle(color: Colors.black),
              //       ),
              //       cursorColor: Colors.black,
              //       cursorHeight: 25,
              //       controller: add_ref_no,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              //   child: Container(
              //     padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         border: Border.all(color: Colors.black)),
              //     child: TextField(
              //       decoration: const InputDecoration(
              //         prefixIcon: Icon(Icons.map, color: Colors.black),
              //         border: InputBorder.none,
              //         labelText: "ADDRESS",
              //         hintStyle: TextStyle(color: Colors.black),
              //         labelStyle: TextStyle(color: Colors.black),
              //       ),
              //       cursorColor: Colors.black,
              //       cursorHeight: 25,
              //       controller: add_ref_no,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
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
                        value: "SOAP",
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'SOAP',
                          'BREAD',
                          'MATCH BOX',
                          'INCENSE STICK',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
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
                        onChanged: ((value) {}),
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
                      prefixIcon: Icon(Icons.map, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "NO OF PRODUCT",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: add_ref_no,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   height: 60,
              //   width: 350,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     border: Border.all(
              //       color: Colors.black,
              //       width: 1,
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.all(20),
              //     child: Row(
              //       children: [
              //         Icon(Icons.person),
              //         SizedBox(width: 12),
              //         DropdownButton<String>(
              //           underline: Container(
              //             color: Colors.white,
              //           ),
              //           borderRadius: BorderRadius.circular(15),
              //           elevation: 0,
              //           focusColor: Colors.white,
              //           value: "ENGINEERING",
              //           // alignment: Alignment.centerLeft,
              //           //elevation: 5,
              //           style: TextStyle(color: Colors.white),
              //           iconEnabledColor: Colors.black,
              //           items: <String>['ITI', 'ENGINEERING', 'POLYTECHNIC']
              //               .map<DropdownMenuItem<String>>((String value) {
              //             return DropdownMenuItem<String>(
              //               value: value,
              //               child: Text(value,
              //                   style: const TextStyle(
              //                       color: Colors.black, fontSize: 15),
              //                   textAlign: TextAlign.left),
              //             );
              //           }).toList(),
              //           hint: const Text(
              //             "SELETE",
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //           onChanged: ((value) {}),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
                    controller: add_ref_no,
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              //   child: Container(
              //     padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         border: Border.all(color: Colors.black)),
              //     child: TextField(
              //       decoration: const InputDecoration(
              //         prefixIcon: Icon(Icons.phone, color: Colors.black),
              //         border: InputBorder.none,
              //         labelText: "CONTACT DETAIL",
              //         hintStyle: TextStyle(color: Colors.black),
              //         labelStyle: TextStyle(color: Colors.black),
              //       ),
              //       cursorColor: Colors.black,
              //       cursorHeight: 25,
              //       controller: add_ref_no,
              //     ),
              //   ),
              // ),
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
                                    add_ref_no.toString(),
                                    name.toString(),
                                    state.toString(),
                                    city.toString(),
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
  String productName,
  String noOfProduct,
  String totalprice,
) async {
  final _MyBox = Hive.box('data');
  if (dateOfPurchase == "" ||
      productName == "" ||
      noOfProduct == "" ||
      totalprice == "") {
    _MyBox.put("kissSubmitStatus", "false");
    return "false";
  }
  Map data = {
    "product_name": "$productName",
    "pid": "12",
    "eid": "hemang",
    "pquantity": "$noOfProduct",
    "pprice": "$totalprice"
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

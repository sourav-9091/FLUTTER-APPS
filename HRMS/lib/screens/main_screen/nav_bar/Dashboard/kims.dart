// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;

// class KIIMS extends StatefulWidget {
//   const KIIMS({super.key});

//   @override
//   State<KIIMS> createState() => _KIIMSState();
// }

// class _KIIMSState extends State<KIIMS> {
//   TextEditingController dateController = TextEditingController();
//   String dropdownvalue = 'Relative';

//   // final List<String> items = [
//   //   'SELF BILLING',
//   //   'REFERRED TO OTHERS',
//   // ];
//   String? selectedValue;

//   // final List<String> items1 = [
//   //   'PATIENT\'S FAMILY',
//   //   'PATIENT\'S NEIGHBOUR',
//   //   'PATIENT\'S RELATIVE',
//   // ];
//   String? selectedValue1;

//   bool isLoading = true;

//   // final List<String> items2 = [
//   //   'COST SPEND BY YOU',
//   //   'COST SPEND BY PATIENT ',
//   // ];
//   String? selectedValue2;
//   File? image;

//   final ImagePicker imagePicker = ImagePicker();
//   List<XFile>? imageFileList = [];

//   void selectImages() async {
//     final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
//     if (selectedImages!.isNotEmpty) {
//       imageFileList!.addAll(selectedImages);
//     }
//     setState(() {});
//   }

//   Future getImage() async {
//     try {
//       final pickedFile =
//           await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

//       if (pickedFile != null) {
//         XFile? image = XFile(pickedFile.path);
//         imageFileList!.add(image);
//         setState(() {});
//       } else {
//         print('no image selected');
//       }
//     } on Exception catch (e) {
//       print(e.toString());
//     }
//   }

//   void myAlert() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             title: const Text('SELECT IMAGE SOURCE'),
//             content: Container(
//               height: MediaQuery.of(context).size.height / 6,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       selectImages();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Row(
//                         children: const [
//                           Icon(Icons.image),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Text('From Gallery'),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Row(
//                         children: const [
//                           Icon(Icons.camera),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Text('From Camera'),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   final _picker = ImagePicker();
//   bool showSpinner = false;
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
//             title: const Text('Are you sure?'),
//             content: const Text('Do you want to return to dashboard'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () =>
//                     Navigator.of(context).pop(false), //<-- SEE HERE
//                 child: const Text('No'),
//               ),
//               TextButton(
//                 onPressed: () =>
//                     Navigator.of(context).pop(true), // <-- SEE HERE
//                 child: const Text('Yes'),
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
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 60,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 1,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20,0,20,0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.person),
//                         const SizedBox(width: 12),
//                         DropdownButton<String>(
//                           underline: Container(
//                             color: Colors.white,
//                           ),
//                           borderRadius: BorderRadius.circular(5),
//                           elevation: 0,
//                           focusColor: Colors.white,
//                           value: "SELF BILLING",
//                           //elevation: 5,
//                           style: TextStyle(color: Colors.white),
//                           iconEnabledColor: Colors.black,
//                           items: <String>[
//                             'SELF BILLING',
//                             'REFERRED TO OTHER',
//                           ].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(
//                                 value,
//                                 style: const TextStyle(
//                                     color: Colors.black, fontSize: 15),
//                               ),
//                             );
//                           }).toList(),

//                           hint: const Text(
//                             "SELETE",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           onChanged: ((value) {}),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 100,
//                   width: 800,
//                   child: Center(
//                     child: Padding(
//                       padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                       child: Container(
//                         padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             border: Border.all(color: Colors.black)),
//                         child: TextField(
//                           readOnly: true,
//                           onTap: () async {
//                             DateTime? pickedDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime(2000),
//                                 lastDate: DateTime(2101));

//                             if (pickedDate != null) {
//                               print(pickedDate);
//                               String formattedDate =
//                                   DateFormat('yyyy-MM-dd').format(pickedDate);
//                               print(formattedDate);

//                               setState(() {
//                                 dateController.text = formattedDate;
//                               });
//                             } else {
//                               print("Date is not selected");
//                             }
//                           },
//                           decoration: const InputDecoration(
//                             prefixIcon:
//                                 Icon(Icons.calendar_today, color: Colors.black),
//                             border: InputBorder.none,
//                             labelText: "DATE OF SERVICE AVAILED",
//                             hintStyle: TextStyle(color: Colors.black),
//                             labelStyle: TextStyle(color: Colors.black),
//                           ),
//                           cursorColor: Colors.black,
//                           cursorHeight: 25,
//                           controller: dateController,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.black)),
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.key, color: Colors.black),
//                         border: InputBorder.none,
//                         labelText: "UHID NO",
//                         hintStyle: TextStyle(color: Colors.black),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                       cursorColor: Colors.black,
//                       cursorHeight: 25,
//                       // controller: add_ref_no,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.black)),
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.key, color: Colors.black),
//                         border: InputBorder.none,
//                         labelText: "BILL NO",
//                         hintStyle: TextStyle(color: Colors.black),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                       cursorColor: Colors.black,
//                       cursorHeight: 25,
//                       // controller: add_ref_no,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(10, 2, 10, 0),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.black)),
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.key, color: Colors.black),
//                         border: InputBorder.none,
//                         labelText: "NAME",
//                         hintStyle: TextStyle(color: Colors.black),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                       cursorColor: Colors.black,
//                       cursorHeight: 25,
//                       // controller: add_ref_no,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   height: 60,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 1,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.person),
//                         const SizedBox(width: 12),
//                         DropdownButton<String>(
//                           underline: Container(
//                             color: Colors.white,
//                           ),
//                           borderRadius: BorderRadius.circular(5),
//                           elevation: 0,
//                           focusColor: Colors.white,
//                           value: "PATIENT\'S FAMILY",
//                           //elevation: 5,
//                           style: TextStyle(color: Colors.white),
//                           iconEnabledColor: Colors.black,
//                           items: <String>[
//                             'PATIENT\'S FAMILY',
//                             'PATIENT\'S RELATIVE',
//                             'PATIENT\'S NEIGHBOUR'
//                           ].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(
//                                 value,
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 15),
//                               ),
//                             );
//                           }).toList(),

//                           hint: const Text(
//                             "SELETE",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           onChanged: ((value) {}),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.black)),
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.key, color: Colors.black),
//                         border: InputBorder.none,
//                         labelText: "PHONE NO OF THE PATIENT",
//                         hintStyle: TextStyle(color: Colors.black),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                       cursorColor: Colors.black,
//                       cursorHeight: 25,
//                       // controller: add_ref_no,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 60,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(
//                       color: Colors.black,
//                       width: 1,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20,0,20,0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.person),
//                         const SizedBox(width: 12),
//                         DropdownButton<String>(
//                           underline: Container(
//                             color: Colors.white,
//                           ),
//                           borderRadius: BorderRadius.circular(5),
//                           elevation: 0,
//                           focusColor: Colors.white,
//                           value: "COST SPEND BY YOU",
//                           //elevation: 5,
//                           style: TextStyle(color: Colors.white),
//                           iconEnabledColor: Colors.black,
//                           items: <String>[
//                             'COST SPEND BY YOU',
//                             'COST SPEND BY PATIENT',
//                           ].map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(
//                                 value,
//                                 style: TextStyle(
//                                     color: Colors.black, fontSize: 15),
//                               ),
//                             );
//                           }).toList(),

//                           hint: const Text(
//                             "SELETE",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           onChanged: ((value) {}),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.black)),
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.key, color: Colors.black),
//                         border: InputBorder.none,
//                         labelText: "ENTER THE COST",
//                         hintStyle: TextStyle(color: Colors.black),
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                       cursorColor: Colors.black,
//                       cursorHeight: 25,
//                       // controller: add_ref_no,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 0, 17, 8),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           InkWell(
//                             onTap: (() {
//                               selectImages();
//                             }),
//                             child: Container(
//                                 decoration: BoxDecoration(
//                                   border: Border.all(),
//                                   borderRadius: const BorderRadius.all(
//                                     Radius.circular(5),
//                                   ),
//                                 ),
//                                 height: 120,
//                                 width: 354,
//                                 child: GridView.builder(
//                                     shrinkWrap: true,
//                                     itemCount: imageFileList!.length,
//                                     gridDelegate:
//                                         const SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 3),
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       return GestureDetector(
//                                         onDoubleTap: () {
//                                           setState(() {
//                                             imageFileList!.removeAt(index);
//                                           });
//                                         },
//                                         child: Image.file(
//                                             File(imageFileList![index].path),
//                                             fit: BoxFit.cover),
//                                       );
//                                     })),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black,
//                               ),
//                               onPressed: () async {
//                                 myAlert();
//                               },
//                               child: Row(
//                                 children: const [
//                                   SizedBox(
//                                     width: 24,
//                                   ),
//                                   Text(
//                                     "PICK AN IMAGE",
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   SizedBox(
//                                     width: 24,
//                                   ),
//                                 ],
//                               )),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           isLoading
//                               ? ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.black,
//                                   ),
//                                   onPressed: () async {
//                                     setState(() {
//                                       isLoading = false;
//                                     });
//                                     setState(() {
//                                       isLoading = true;
//                                     });
//                                   },
//                                   child: Row(
//                                     children: const [
//                                       SizedBox(
//                                         width: 40,
//                                       ),
//                                       Text(
//                                         "SUBMIT",
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       SizedBox(
//                                         width: 40,
//                                       ),
//                                     ],
//                                   ))
//                               : Center(child: CircularProgressIndicator()),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//     ;
//   }
// }

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
//   try {
//     var response = await http.post(
//         Uri.parse("http://10.7.212.230:5000/api/kiss/adddata"),
//         headers: {"Content-Type": "application/json"},
//         body: body);
//     if (response.statusCode == 201) {
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
//   return "false";
// }

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class KIIMS extends StatefulWidget {
  const KIIMS({super.key});

  @override
  State<KIIMS> createState() => _KIIMSState();
}

class _KIIMSState extends State<KIIMS> {
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

  final dateController = TextEditingController();

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
                height: 5,
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
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "UHID NO",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: add_ref_no,
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
                      labelText: "BILL NO",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: add_ref_no,
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
                      labelText: "NAME",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: add_ref_no,
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
                        value: "SELF BILLING",
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'SELF BILLING',
                          'REFERRED TO OTHER',
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
                        value: "PATIENT\'S FAMILY",
                        // alignment: Alignment.centerLeft,
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'PATIENT\'S FAMILY',
                          'PATIENT\'S RELATIVE',
                          'PATIENT\'S NEIGHBOUR'
                        ].map<DropdownMenuItem<String>>((String value) {
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
                      prefixIcon: Icon(Icons.money, color: Colors.black),
                      border: InputBorder.none,
                      labelText: "ENTER THE COST",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: add_ref_no,
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
                      labelText: "CONTACT DETAIL OF THE PATIENT",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    controller: add_ref_no,
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

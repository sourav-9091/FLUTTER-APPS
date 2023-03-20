import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/product.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class KIIS extends StatefulWidget {
  const KIIS({super.key});

  @override
  State<KIIS> createState() => _KIISState();
}

class _KIISState extends State<KIIS> {
  String dropdownvalue = 'SELECT AN ITEM';
  var items = [
    'SOAP',
    'BREAD',
    'MATCH BOX',
    'INCENSE STICK',
    'SELECT AN ITEM',
    'SOAP',
    'BREAD',
    'MATCH BOX',
    'INCENSE STICK',
    'SELECT AN ITEM',
    'SOAP',
    'BREAD',
    'MATCH BOX',
    'INCENSE STICK',
  ];
  String? selectedValue;

  String dropdownvalue1 = 'Department';
  final List<String> items1 = [
    'ITI',
    'ENGINEERING',
    'POLYTECHNIC',
  ];
  String? selectedValue1;

  final List<Product> kiss_items = [
    Product(
        no_of_item: 5,
        amount: 99,
        item_id: "hello",
        item_name: "Soap",
        trac_id: "trac_id"),
    Product(
        no_of_item: 5,
        amount: 99,
        item_id: "world",
        item_name: "bread",
        trac_id: "t"),
  ];

  final _MyBox = Hive.box('data');

  void addNewTransaction(String item, int no_of_product) {
    final newPro = Product(
        no_of_item: no_of_product,
        amount: 99,
        item_id: "123",
        item_name: item,
        trac_id: "trac_id");

    setState(() {
      kiss_items.add(newPro);
    });
  }

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

  // final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  // var dummyselectedItems = <String>[];
  var items12 = <String>[];

  void filterSearchResults(String query) {
    print('\n\n\n\n\n\n$query\n\n\n\n\n\n\n');
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(items);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items12.clear();
        items12.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items12.clear();
        items12.addAll(items);
      });
    }
  }

  final add_ref_no = TextEditingController();
  final name = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final amt_paid = TextEditingController();
  final contact_no = TextEditingController();
  final dateController = TextEditingController();
  final editingController = TextEditingController();
  final itemController = TextEditingController();

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
              GestureDetector(
                onTap: () {
                  Dialog errorDialog = Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: MaterialApp(
                      home: Scaffold(
                        body: GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: TextField(
                                //     onChanged: (value) {
                                //       setState(() {
                                //         filterSearchResults(value);
                                //       });
                                //     },
                                //     controller: editingController,
                                //     decoration: InputDecoration(
                                //       labelText: "Search",
                                //       hintText: "Search",
                                //       prefixIcon: Icon(Icons.search),
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(25.0),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: items12.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (() {
                                          itemController.text = items12[index];
                                          Navigator.pop(context);
                                        }),
                                        child: ListTile(
                                          title: Text(
                                            '${items12[index]}',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.production_quantity_limits,
                      ),
                      Text(
                        "SELECT AN ITEM",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
              //     padding: const EdgeInsets.all(20.0),
              //     child: GestureDetector(
              //       onTap: () {
              //         Dialog errorDialog = Dialog(
              //           shape: RoundedRectangleBorder(
              //               borderRadius:
              //                   BorderRadius.circular(12.0)), //this right here
              //           child: MaterialApp(
              //             home: Scaffold(
              //               body: GestureDetector(
              //                 onTap: () {
              //                   setState(() {});
              //                 },
              //                 child: Container(
              //                   child: Column(
              //                     children: <Widget>[
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: TextField(
              //                           onChanged: (value) {
              //                             setState(() {
              //                               filterSearchResults(value);
              //                             });
              //                           },
              //                           controller: editingController,
              //                           decoration: InputDecoration(
              //                             labelText: "Search",
              //                             hintText: "Search",
              //                             prefixIcon: Icon(Icons.search),
              //                             border: OutlineInputBorder(
              //                               borderRadius: BorderRadius.all(
              //                                 Radius.circular(25.0),
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                       Expanded(
              //                         child: ListView.builder(
              //                           shrinkWrap: true,
              //                           itemCount: items12.length,
              //                           itemBuilder: (context, index) {
              //                             return ListTile(
              //                               title: Text(
              //                                 '${items12[index]}',
              //                                 style: TextStyle(
              //                                   color: Colors.black,
              //                                 ),
              //                               ),
              //                             );
              //                           },
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //         showDialog(
              //             context: context,
              //             builder: (BuildContext context) => errorDialog);
              //       },
              //       child: Row(
              //         children: [
              //           const Icon(Icons.person),
              //           const SizedBox(width: 12),
              //           // DropdownButton<String>(
              //           //   icon: Icon(Icons.arrow_drop_down),
              //           //   underline: Container(
              //           //     color: Colors.white,
              //           //   ),
              //           //   borderRadius: BorderRadius.circular(5),
              //           //   elevation: 0,
              //           //   focusColor: Colors.white,
              //           //   value: dropdownvalue,
              //           //   //elevation: 5,
              //           //   style: TextStyle(color: Colors.white),
              //           //   iconEnabledColor: Colors.black,
              //           //   items:
              //           //       items.map<DropdownMenuItem<String>>((String val) {
              //           //     return DropdownMenuItem(
              //           //       value: val,
              //           //       child: Text(
              //           //         val,
              //           //         style:
              //           //             TextStyle(color: Colors.black, fontSize: 15),
              //           //       ),
              //           //     );
              //           //   }).toList(),
              //           //   onChanged: ((String? value) {
              //           //     setState(() {
              //           //       dropdownvalue = value!;
              //           //     });
              //           //   }),
              //           // ),
              //           Text(
              //             "SELECT AN ITEM",
              //             style: TextStyle(
              //               fontSize: 16,
              //             ),
              //           ),
              //         ],
              //       ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () async {
                    addNewTransaction("item", 23);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "ADD AN ITEM",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 400,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.black)),
                          elevation: 1,
                          margin: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 5,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 20,
                              child: Padding(
                                padding: EdgeInsets.all(6),
                                child: FittedBox(
                                  child: Text(
                                    '${kiss_items[index].amount}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              kiss_items[index].item_name,
                            ),
                            trailing: IconButton(
                                icon: Icon(Icons.delete),
                                color: Theme.of(context).errorColor,
                                onPressed: () {
                                  setState(() {
                                    kiss_items.removeWhere((tx) =>
                                        tx.item_id ==
                                        kiss_items[index].item_id);
                                  });
                                }),
                          ),
                        );
                      },
                      itemCount: kiss_items.length,
                    ),
                  ),
                ),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Image.file(
                                            File(imageFileList![index].path),
                                            fit: BoxFit.cover),
                                      ),
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
                                    isLoading = true;
                                  });
                                  void myAlert() {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            title: const Text(
                                                'CONFIRM YOU WANT TO SUBMIT ?'),
                                            content: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  6,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      // onPressed: () async {
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
                                                      Navigator.pop(context);
                                                      void myAlert1() {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8)),
                                                                title: const Text(
                                                                    'SUBMISSION STATUS'),
                                                                content:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      6,
                                                                  child: Column(
                                                                    children: [
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          _MyBox.get('kissSubmitStatus') == "true"
                                                                              ? Text(
                                                                                  "SUBMISSION SUCCESSFUL",
                                                                                  style: TextStyle(
                                                                                    fontSize: 20,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                )
                                                                              : Text(
                                                                                  _MyBox.get('kissErrorMessage'),
                                                                                  style: TextStyle(
                                                                                    fontSize: 20,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                          SizedBox(
                                                                            height:
                                                                                30,
                                                                          ),
                                                                          ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              backgroundColor: Colors.black,
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(10.0),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: const [
                                                                                  SizedBox(
                                                                                    width: 6,
                                                                                  ),
                                                                                  Text('OK, GO BACK'),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      }

                                                      myAlert1();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          SizedBox(
                                                            width: 6,
                                                          ),
                                                          Text('OK, SUBMIT'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }

                                  myAlert();
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
              ),
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
    _MyBox.put("kissErrorMessage", "No Internet connection 😑");
  } on HttpException {
    print("Couldn't find the post 😱");
    _MyBox.put("kissSubmitStatus", "false");
    _MyBox.put("kissErrorMessage", "Couldn't find the post 😱");
  } on FormatException {
    print("Bad response format 👎");
    _MyBox.put("kissSubmitStatus", "false");
    _MyBox.put("kissErrorMessage", "Bad response format 👎");
  }
  return "false";
}

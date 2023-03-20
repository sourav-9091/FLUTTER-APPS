import 'package:flutter/material.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/product.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

bool isLoading = true;

class _HistoryState extends State<History> {
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
                      // Navigator.pop(context);
                      // // getImage(ImageSource.gallery);
                      // selectImages();
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
                      // Navigator.pop(context);
                      // getImage();
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

  String dropdownvalue = 'SELECT AN ITEM';
  var items = [
    'SELECT AN ITEM',
    'KIIT',
    'KIMS',
    'TEMPLE TRUST',
    'KISS',
    'HOSPITALITY',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Container(
              height: 60,
              width: 220,
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
                      icon: Icon(Icons.arrow_drop_down),
                      underline: Container(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      elevation: 0,
                      focusColor: Colors.white,
                      value: dropdownvalue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: items.map<DropdownMenuItem<String>>((String val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(
                            val,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: ((String? value) {
                        setState(() {
                          dropdownvalue = value!;
                        });
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      Text(
                        "SEARCH",
                        textAlign: TextAlign.center,
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
                        // setState(() {
                        //   isLoading = false;
                        // });
                        // await addData(
                        //   add_ref_no.toString(),
                        //   name.toString(),
                        //   state.toString(),
                        //   city.toString(),
                        // );
                        // setState(() {
                        //   isLoading = true;
                        // });
                      },
                      child: Row(
                        children: const [
                          Text(
                            "REFRESH",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ))
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 500,
                width: 400,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                              //style: Theme.of(context).textTheme.title,
                            ),
                            // subtitle: Text(
                            //   DateFormat.yMMMd()
                            //       .format(widget.transactions[index].date),
                            // ),
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
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:attend/Widgets/drawer.dart';
import 'package:attend/Widgets/drawerDark.dart';
import 'package:flutter/material.dart';
import 'newPage.dart';

class NewPageDark extends StatefulWidget {
  const NewPageDark({super.key});

  @override
  State<NewPageDark> createState() => _NewPageDarkState();
}

class _NewPageDarkState extends State<NewPageDark> {
  final present = TextEditingController();
  final total = TextEditingController();
  final result = TextEditingController();
  int percent = 75;

  setResult() {
    setState(() {
      result.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        FocusManager.instance.primaryFocus?.unfocus(),
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "ATTENDANCE 75",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.sunny),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const NewPage()));
              },
            ),
          ],
        ),
        drawer: const Drawer(
          child: DrawerWidgetDark(),
        ),
        body: GestureDetector(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: present,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "PRESENT",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: total,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "TOTAL",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      underline: Container(
                        color: Colors.black,
                      ),
                      dropdownColor: Colors.black,
                      focusColor: Colors.black,
                      value: percent.toString(),
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),
                      iconEnabledColor: Colors.white,
                      items: <String>[
                        '60',
                        '65',
                        '70',
                        '75',
                        '80',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "SELETE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      // onChanged: (String value) {
                      //   setState(() {
                      //     _chosenValue = value;
                      //   });
                      // },
                      onChanged: ((value) {
                        setState(() {
                          percent;
                        });
                        percent = int.parse(value!);
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: (() {
                    int pre = int.parse(present.text);
                    int tot = int.parse(total.text);
                    double totPercent = (pre / tot) * 100;
                    if (present.text == Null || total.text == Null) {
                      result.text = "INVALID INPUT TRY AGAIN";
                    } else if (present.text == "" || total.text == "") {
                      result.text = "INVALID INPUT TRY AGAIN";
                    } else if (present.text == "" && total.text == "") {
                      result.text = "INVALID INPUT TRY AGAIN";
                    } else if (pre < 0 || tot < 0 || pre > tot) {
                      result.text = "INVALID INPUT TRY AGAIN";
                    } else if (pre / tot >= (percent / 100)) {
                      double db = ((100 * pre) - (percent * tot)) / percent;
                      double newTot = tot + db;
                      result.text =
                          "YOU CAN BUNK FOR ${db.toInt()} DAYS\n\nCURRENT ATTENDANCE : $pre/$tot = ${totPercent.toStringAsFixed(2)}%\n\nATTENDANCE AFTER ${db.toInt()} BUNKS : $pre/${newTot.toInt()} = ${((pre / (newTot.toInt())) * 100).toStringAsFixed(2)}%";
                    } else {
                      double reqAttendance =
                          ((percent * tot) - (100 * pre)) / (100 - percent);
                      result.text =
                          "YOU HAVE TO ATTEND ${reqAttendance.toInt()} DAYS\n\nCURRENT ATTENDANCE : $pre/$tot = ${totPercent.toStringAsFixed(2)}%\n\nTOTAL ATTENDANCE REQUIRED : ${reqAttendance.toInt() + pre}/${((reqAttendance.toInt() + tot))}";
                    }

                    setResult();
                    FocusManager.instance.primaryFocus?.unfocus();
                  }),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: const Text(
                    "CALCULATE",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  result.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ),
    );
  }
}

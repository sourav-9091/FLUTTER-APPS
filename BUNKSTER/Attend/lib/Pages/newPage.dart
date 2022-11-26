import 'package:attend/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'newPageDark.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  final present = TextEditingController();
  final total = TextEditingController();
  final result = TextEditingController();
  int percent = 75;

  setResult() {
    setState(() {
      result.text;
      percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        FocusManager.instance.primaryFocus?.unfocus(),
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "ATTENDANCE 75",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.dark_mode),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewPageDark()));
              },
            ),
          ],
        ),
        drawer: const Drawer(
          child: DrawerWidget(),
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
                    controller: present,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "PRESENT",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.black,
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
                    controller: total,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "TOTAL",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.black,
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
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      underline: Container(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      elevation: 0,
                      focusColor: Colors.white,
                      value: percent.toString(),
                      //elevation: 5,
                      style: TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
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
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "SELETE",
                        style: TextStyle(
                            color: Colors.black,
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
                    if (present.text == "" || total.text == "") {
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
                    primary: Colors.black,
                  ),
                  child: const Text(
                    "CALCULATE",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  result.text,
                  style: const TextStyle(
                    color: Colors.black,
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

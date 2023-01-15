import 'package:flutter/material.dart';

import 'myButton.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            //autofocus: true,
            controller: controller,
            decoration: InputDecoration(
                //focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.white),
                ),
                labelText: "ADD A NEW TASK",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                )
                //fillColor: Colors.black,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "SAVE", onPressed: onSave),
              SizedBox(width: 12),
              MyButton(text: "CANCEL", onPressed: onCancel),
            ],
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  final String content;
  const AlertBox({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('TRY AGAIN'),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
        ),
      ],
    );
  }
}

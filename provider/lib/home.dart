import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(
        child: Column(children: [
          Text(
            '0',
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Text(
                  '1',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

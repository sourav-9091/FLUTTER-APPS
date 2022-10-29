import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Color _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    print("The random number is :- " + Random().nextInt(4).toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // CODE TO MANAGE THE MEDIAQUERY OBJECT AS WE KNOW DEVICE CONFIGURATION IS NOT GOING TO CHANGE AFTER IT HAS BEEN BUILD
    final mediaQuery = MediaQuery.of(context);
    // CODE TO SHOW HOW TO USE LAYOUT BUILDER
    return LayoutBuilder(builder: (context, Contraints) {
      return widget.transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  //style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: Contraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _bgColor,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${widget.transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.transactions[index].title,
                      //style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd()
                          .format(widget.transactions[index].date),
                    ),
                    trailing: mediaQuery.size.width > 360
                        ? TextButton.icon(
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            onPressed: () =>
                                widget.deleteTx(widget.transactions[index].id),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () =>
                                widget.deleteTx(widget.transactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: widget.transactions.length,
            );
    });
  }
}

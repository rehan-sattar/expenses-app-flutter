import 'package:flutter/material.dart';
import './transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // list of transactions
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Transaction 01',
      amount: 23.43,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Transaction 02',
      amount: 32.33,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              child: Text('CHART'),
            ),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Text(transaction.title),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

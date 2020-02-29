import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: FittedBox(
              child: Text(
                transaction.amount.toStringAsFixed(2),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(
              transaction.date,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () => this.deleteTransaction(transaction.id),
          ),
        ),
      ),
    );
  }
}

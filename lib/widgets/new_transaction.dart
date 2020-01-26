import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function onSubmit;
  NewTransaction(this.onSubmit);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControllar = TextEditingController();

  final amountControllar = TextEditingController();

  void submitHandler() {
    final enteredTitle = titleControllar.text;
    final enteredAmount = double.parse(amountControllar.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.onSubmit(enteredTitle, enteredAmount);
    // after adding we will close the bottom modal.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControllar,
              onSubmitted: (_) => submitHandler(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControllar,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitHandler(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitHandler,
            ),
          ],
        ),
      ),
    );
  }
}

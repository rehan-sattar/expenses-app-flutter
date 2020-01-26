import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function onSubmit;
  NewTransaction(this.onSubmit);

  final titleControllar = TextEditingController();
  final amountControllar = TextEditingController();

  void submitHandler() {
    final enteredTitle = titleControllar.text;
    final enteredAmount = double.parse(amountControllar.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    this.onSubmit(enteredTitle, enteredAmount);
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
              onSubmitted: (_) => this.submitHandler(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControllar,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => this.submitHandler(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: this.submitHandler,
            ),
          ],
        ),
      ),
    );
  }
}

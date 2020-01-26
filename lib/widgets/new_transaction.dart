import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function onSubmit;
  NewTransaction(this.onSubmit);

  final titleControllar = TextEditingController();
  final amountControllar = TextEditingController();

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControllar,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                print(titleControllar.text);
                print(amountControllar.text);
                this.onSubmit(
                  titleControllar.text,
                  double.parse(
                    amountControllar.text,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

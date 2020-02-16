import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onSubmit;
  NewTransaction(this.onSubmit);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControllar = TextEditingController();
  final _amountControllar = TextEditingController();
  DateTime _selectedDate;

  void _submitHandler() {
    if (_amountControllar.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleControllar.text;
    final enteredAmount = double.parse(_amountControllar.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(enteredTitle, enteredAmount, _selectedDate);
    // after adding we will close the bottom modal.
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            right: 10,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleControllar,
                onSubmitted: (_) => _submitHandler(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountControllar,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitHandler(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Choosen.'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _showDatePicker,
                    )
                  ],
                ),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: _submitHandler,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

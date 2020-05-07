import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class usertranform extends StatefulWidget {
  //submit form
  final Function tranxhandler;

  usertranform(this.tranxhandler);

  @override
  _usertranformState createState() => _usertranformState();
}

class _usertranformState extends State<usertranform> {
  final inputTitle = TextEditingController();

  final inputPrice = TextEditingController();

  DateTime _selectedDate;

  void submitdate() {
    if (inputPrice.text.isEmpty) {
      return;
    }

    final intitle = inputTitle.text;
    final inPrice = double.parse(inputPrice.text);

    if (intitle.isEmpty || inPrice <= 0 || _selectedDate == null) {
      return;
    }
    widget.tranxhandler(
      intitle,
      inPrice,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        elevation: 5,
        child: Container(
           padding: EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 
           MediaQuery.of(context).viewInsets.bottom +10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: inputTitle,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submitdate(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: inputPrice,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitdate(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ),

             RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: submitdate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

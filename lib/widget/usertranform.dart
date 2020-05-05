

import 'package:flutter/material.dart';


class usertranform extends StatelessWidget {
  //submit form
  final inputTitle = TextEditingController();
  final inputPrice = TextEditingController();
   final Function tranxhandler;
 
     usertranform(this.tranxhandler);
     
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: inputTitle,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: inputPrice,
            ),
            FlatButton(
              onPressed: () {
                tranxhandler(inputTitle.text, double.parse(inputPrice.text));
              },
              child: Text('add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}

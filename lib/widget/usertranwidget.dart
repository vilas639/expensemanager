
import 'package:expensemanager/Model/transaction.dart';
import 'package:expensemanager/widget/usertranList.dart';
import 'package:expensemanager/widget/usertranform.dart';
import 'package:flutter/material.dart';

class usertranwidget extends StatefulWidget {
  @override
  _usertranwidgetState createState() => _usertranwidgetState();
}

class _usertranwidgetState extends State<usertranwidget> {
  //creat a array ofm trnascations
  final List<Transaction> myTransaction = [
    Transaction(
        id: '1', title: 'monthly glocerry', amount: 2000, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Mutual Funds', amount: 600, date: DateTime.now()),
  ];
  
   
    void addtran(String intitle, double inprice) {
    print('value added' + intitle);
    print('value added' + inprice.toString());

    //go to List call usertanslIst constructr
    var newtrax =Transaction(
        id: DateTime.now().toString(), title: intitle, amount: inprice, date: DateTime.now());

        setState(() {
          myTransaction.add(newtrax);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
           usertranform(addtran),
           usertranList(this.myTransaction)
    ],
      
    );
  }
}
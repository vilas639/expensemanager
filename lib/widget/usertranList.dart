
import 'package:expensemanager/Model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class usertranList extends StatelessWidget {
   
   List<Transaction> myTransaction1 = [];

   usertranList(this.myTransaction1);
  
  
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 400,
      child: SingleChildScrollView(
              child: Column(
                  children: myTransaction1.map((f) {
                    return Card(
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            margin:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: Text(
                              '\u20A8 ${f.amount.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.purple, width: 2)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                f.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(DateFormat('yyyy-MM-dd').format(f.date),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ))
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
      ),
    );
  }
}
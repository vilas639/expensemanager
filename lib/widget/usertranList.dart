import 'package:expensemanager/Model/transaction.dart';
import 'package:expensemanager/widget/usertranitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class usertranList extends StatelessWidget {
  List<Transaction> myTransaction1 = [];
  final Function deleteTx;

  usertranList(this.myTransaction1, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print("build() usertranlist");
    return myTransaction1.isEmpty
        ? LayoutBuilder(
            builder: (ctx, Constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transaction Availble Yet !',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: Constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return usertranItem(
                  myTransaction1: myTransaction1[index], deleteTx: deleteTx);
            },
            itemCount: myTransaction1.length,
          );
  }
}

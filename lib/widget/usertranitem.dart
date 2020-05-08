import 'package:expensemanager/Model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class usertranItem extends StatelessWidget {
  const usertranItem({
    Key key,
    @required this.myTransaction1,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction myTransaction1;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(
                child: Text(
                  ' ${myTransaction1.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            myTransaction1.title,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(DateFormat('yyyy-MM-dd').format(myTransaction1.date),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              )),
          trailing: MediaQuery.of(context).size.width > 420
              ? FlatButton.icon(
                  icon: Icon(Icons.delete),
                  textColor: Theme.of(context).errorColor,
                  label: Text('delete'),
                  onPressed: () => deleteTx(myTransaction1.id),
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(myTransaction1.id),
                ),
        ));
  }
}

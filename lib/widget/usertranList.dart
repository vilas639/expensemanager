import 'package:expensemanager/Model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class usertranList extends StatelessWidget {
  List<Transaction> myTransaction1 = [];
 final Function deleteTx;

  usertranList(this.myTransaction1,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return myTransaction1.isEmpty
          ? LayoutBuilder(
             builder: (ctx, Constraints)
             {
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
                              ' ${myTransaction1[index].amount.toStringAsFixed(2)}',
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
                        myTransaction1[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                          DateFormat('yyyy-MM-dd')
                              .format(myTransaction1[index].date),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          )),
                          trailing:  MediaQuery.of(context).size.width > 420 ? 
                          FlatButton.icon(
                             icon: Icon(Icons.delete),
                             textColor: Theme.of(context).errorColor,
                             label: Text('delete'),
                             onPressed: () => deleteTx(myTransaction1[index].id),

                            ) :IconButton(
                             icon: Icon(Icons.delete),
                             color: Theme.of(context).errorColor,
                             onPressed: () => deleteTx(myTransaction1[index].id),

                            ),
                    ));
              },
              itemCount: myTransaction1.length,
            );
    
  }
}

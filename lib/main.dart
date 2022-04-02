import 'package:flutter/material.dart';
import 'transcations.dart';

void main() => runApp(Expense());

class Expense extends StatefulWidget {
  Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Transcations> transcations = [
    Transcations(
        id: "01", title: "New Phone", amount: 69.99, date: DateTime.now()),
    Transcations(
        id: "02", title: "New Shoes", amount: 19.99, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: transcations.map((tx) {
                return Card(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(border: Border.all(width: 2)),
                            child: Text(
                              tx.amount.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tx.title, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text(tx.date.toString(),style: TextStyle(color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                    ));
              }).toList(),
            ),
          ),
        ));
  }
}

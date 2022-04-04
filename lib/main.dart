import 'package:flutter/material.dart';
import 'package:expense/widget/transcation_list.dart';


void main() => runApp(Expense());

class Expense extends StatefulWidget {
  Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
          ),
          body: 
            Column(children: [
              Container(),
              TranscationList(),
              
            ]),
          ),
        );
  }
}

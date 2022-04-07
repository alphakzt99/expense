import 'package:flutter/material.dart';
import 'package:expense/widget/transcation_list.dart';
import 'package:expense/widget/user_transcations.dart';

import 'package:expense/models/transcations.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Expense(),
    );
  }
}

class Expense extends StatefulWidget {
  Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  List<Transcations> usertranscations = [
    Transcations(
        id: "01", title: "New shoe", amount: 69.99, date: DateTime.now()),
    Transcations(
        id: "02", title: "New phone", amount: 123.99, date: DateTime.now())
  ];
  void _addTranscation(String txtitle, double txamount) {
    final newTx = Transcations(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());
    setState(() {
      usertranscations.add(newTx);
    });
  }

  void _startNewTranscation(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return GestureDetector(
            onTap: (){},
            child: UserTranscations(_addTranscation),
            behavior: HitTestBehavior.opaque,);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTranscation(context),
      ),
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Container(),
          TranscationList(
            usertranscations: usertranscations,
          ),
        ]),
      ),
    );
  }
}

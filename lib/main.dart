import 'package:expense/widget/chart.dart';
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
        debugShowCheckedModeBanner: false,
        home: Expense(),
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'SourceSansPro',
          buttonTheme:
              ThemeData.dark().buttonTheme.copyWith(buttonColor: Colors.purple),
          //textTheme define globally and use ThemeData
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'PlayfairDisplay', fontWeight: FontWeight.w600)),
        ));
  }
}

class Expense extends StatefulWidget {
  Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  List<Transcations> usertranscations = [
    Transcations(id: 'k1', title: 'shit', amount: 12.99, date: DateTime.now()),
    Transcations(
        id: 'k2',
        title: 'nothing',
        amount: 13.99,
        date: DateTime.parse("2022-04-06"))
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

  void _startNewTranscation() {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return UserTranscations(_addTranscation);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _startNewTranscation,
      ),
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Chart(usertranscations),
          TranscationList(
            usertranscations: usertranscations,
          ),
        ]),
      ),
    );
  }
}

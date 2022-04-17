import 'package:expense/widget/chart.dart';
import 'package:expense/widget/new_transcations.dart';
import 'package:flutter/material.dart';
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
  List<Transcations> usertranscations = [];
  void _addTranscation(String txtitle, double txamount, DateTime selectedDate) {
    final newTx = Transcations(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: selectedDate);
    setState(() {
      usertranscations.add(newTx);
    });
  }

  bool _changed = false;

  void _startNewTranscation() {
    showModalBottomSheet(
        context: context,
        builder: (bctx) {
          return UserTranscations(_addTranscation);
        });
  }

  void _deleteTranscations(String id) {
    setState(() {
      usertranscations.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _startNewTranscation,
      ),
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Container(
          child: Column(children: [
        if (isLandscape)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Show Chart"),
              Switch(
                  value: _changed,
                  onChanged: (val) {
                    setState(() {
                      _changed = val;
                    });
                  })
            ],
          ),
        
        if (!isLandscape) Container(
          height: (MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top) * 0.3,
          child: Chart(usertranscations,)),
        if (!isLandscape)
          Container(
            height: (MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
            child: NewTranscations(
                usertranscations, _deleteTranscations, _addTranscation),
          ),
        if (isLandscape)
          _changed
              ? Container(
                height: (MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
                child: Chart(usertranscations,))
              : Container(
                height: (MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
                child: NewTranscations(
                    usertranscations, _deleteTranscations, _addTranscation),
              ),
      ])),
    );
  }
}

import 'package:expense/widget/chart.dart';
import 'package:expense/widget/new_transcations.dart';
import 'package:flutter/material.dart';
import 'package:expense/widget/user_transcations.dart';
import 'package:expense/models/transcations.dart';

void main() => runApp(Home());
bool _theme = false;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Expense(),
        theme: ThemeData(
          
          primaryColor: Color.fromRGBO(255, 183, 3, 0.8),
          primaryColorDark: Color.fromRGBO(0, 37, 56, 1),
          primaryColorLight: Color.fromRGBO(142, 202, 230, 1),
          fontFamily: 'SourceSansPro',
          errorColor: Theme.of(context).errorColor,
          buttonTheme:
              ThemeData.dark().buttonTheme.copyWith(buttonColor: Colors.purple),
          //textTheme define globally and use ThemeData
          
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
        backgroundColor: Theme.of(context).primaryColorDark,
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
        centerTitle: true,
        elevation: 0,
        backgroundColor: _theme
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColorLight,
        title: Text(
          'Personal Expenses',
          style: TextStyle(
            fontFamily: "PlayFairDisplay",
            fontSize: 30,
            fontWeight: FontWeight.bold,
              color: _theme
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorDark),
        ),
      ),
      body: Container(
          color: _theme
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColorLight,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dark Theme",
                    style: TextStyle(
                      fontFamily: "PlayFairDisplay",
                      fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: _theme
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark)),
                Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value: _theme,
                    onChanged: (val) {
                      setState(() {
                        _theme = val;
                      });
                    }),
              ],
            ),
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
            if (!isLandscape)
              Container(
                  
                  height: (MediaQuery.of(context).size.height -
                          AppBar().preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                  child: Chart(
                    usertranscations,_theme
                  )),
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.6,
                child: NewTranscations(usertranscations, _deleteTranscations,
                    _addTranscation, _theme),
              ),
            if (isLandscape)
              _changed
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              AppBar().preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(
                        usertranscations,_theme
                      ))
                  : Container(
                      height: (MediaQuery.of(context).size.height -
                              AppBar().preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: NewTranscations(usertranscations,
                          _deleteTranscations, _addTranscation, _theme),
                    ),
          ])),
    );
  }
}

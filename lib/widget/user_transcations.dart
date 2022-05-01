import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTranscations extends StatefulWidget {
  final Function add;
  UserTranscations(this.add);

  @override
  _UserTranscationsState createState() => _UserTranscationsState();
}

class _UserTranscationsState extends State<UserTranscations> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);

    // ignore: unnecessary_null_comparison
    if (enteredAmount <= 0 || enteredTitle.isEmpty || selectedDate == null) {
      return;
    }
    widget.add(enteredTitle, enteredAmount, selectedDate);

    Navigator.of(context).pop();
  }

  void _datepicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      //then is used when you want to execute a function when a future is resolved.
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              style: TextStyle(color: Theme.of(context).primaryColorLight),
              decoration: InputDecoration(
                  labelText: "TITLE",
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor)),
              controller: titlecontroller,
              onSubmitted: (arg) => submitData(),
            ),
            TextField(
              style: TextStyle(color: Theme.of(context).primaryColorLight),
              decoration: InputDecoration(
                  labelText: "AMOUNT",
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor)),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (arg) => submitData(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  // ignore: unnecessary_null_comparison
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(
                       'Picked Date: ${DateFormat.yMd().format(selectedDate)}',
                      style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: TextButton(
                        onPressed: _datepicker,
                        child: Text(
                          'CHOOSE DATE',
                          style: TextStyle(fontSize:15,color: Theme.of(context).primaryColor),
                        )),
                  )
                ],
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: submitData,
                child: Text(
                  "ADD TRANSCATION",
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ))
          ],
        ),
      ),
    );
  }
}

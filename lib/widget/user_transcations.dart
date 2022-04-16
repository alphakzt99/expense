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
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "title"),
              controller: titlecontroller,
              onSubmitted: (arg) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (arg) => submitData(),
            ),
            Row(
              children: [
                // ignore: unnecessary_null_comparison
                Text(selectedDate == null
                    ? "Nothing yet"
                    : 'Picked Date: ${DateFormat.yMd().format(selectedDate)}'),
                Flexible(
                  fit: FlexFit.tight,
                  child: TextButton(
                      onPressed: _datepicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(color: Colors.purple),
                      )),
                )
              ],
            ),
            ElevatedButton(onPressed: submitData, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}

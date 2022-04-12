import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTranscations extends StatefulWidget {
  final Function add;
  UserTranscations(this.add);

  @override
  _UserTranscationsState createState() => _UserTranscationsState();
}

class _UserTranscationsState extends State<UserTranscations> {
  final _titlecontroller = TextEditingController();

  final _amountcontroller = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = _titlecontroller.text;
    final enteredAmount = double.parse(_amountcontroller.text);

    // ignore: unnecessary_null_comparison
    if (enteredAmount <= 0 || enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }
    widget.add(enteredTitle, enteredAmount,_selectedDate);

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
        _selectedDate = value;
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
              controller: _titlecontroller,
              onSubmitted: (arg) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (arg) => _submitData(),
            ),
            Row(
              children: [
                // ignore: unnecessary_null_comparison
                Text(_selectedDate == null
                    ? "Nothing yet"
                    : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
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
            ElevatedButton(onPressed: _submitData, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}

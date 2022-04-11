import 'package:flutter/material.dart';

class UserTranscations extends StatefulWidget {
  final Function add;
  UserTranscations(this.add);

  @override
  _UserTranscationsState createState() => _UserTranscationsState();
}

class _UserTranscationsState extends State<UserTranscations> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.add(enteredTitle, enteredAmount);
    
    Navigator.of(context).pop();
  }

  void _datepicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now());
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
                Text("Nothing yet"),
                TextButton(
                    onPressed: _datepicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(color: Colors.purple),
                    ))
              ],
            ),
            ElevatedButton(onPressed: submitData, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}

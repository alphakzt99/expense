import 'package:flutter/material.dart';

class UserTranscations extends StatelessWidget {
  final Function add;
  UserTranscations(this.add);
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountcontroller.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    add(enteredTitle,enteredAmount);
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
              onSubmitted: (arg) =>submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (arg) =>submitData(),
            ),
            ElevatedButton(onPressed: submitData, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}

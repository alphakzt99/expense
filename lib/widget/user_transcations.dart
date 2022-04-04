import 'package:flutter/material.dart';

class UserTranscations extends StatelessWidget {
  final Function add;
  UserTranscations(this.add);
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
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
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: () {
                  add(titlecontroller.text,double.parse(amountcontroller.text));
                },
                child: Text("Save"))
          ],
        ),
      ),
    );
  }
}

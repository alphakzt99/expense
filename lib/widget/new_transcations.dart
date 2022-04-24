import 'package:flutter/material.dart';
import 'package:expense/widget/TranscationItem.dart';

class NewTranscations extends StatefulWidget {
  List userTranscations = [];
  final Function add;
  Function deleteTranscations;
  NewTranscations(
    this.userTranscations,
    this.deleteTranscations,
    this.add,
  );

  @override
  _NewTranscationsState createState() => _NewTranscationsState();
}

class _NewTranscationsState extends State<NewTranscations> {
  void _editTranscations(
      String id, String title, double amount, DateTime date) {
    widget.userTranscations.remove(title);
    widget.userTranscations.remove(amount);
    widget.userTranscations.remove(date);
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return widget.userTranscations.isEmpty
        ? LayoutBuilder(
            builder: (context2, constraints) => Column(
              children: [
                Text(
                  'No Transcation Yet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/Waiting.jpg',
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          )
        : ListView.builder(
            itemBuilder: (context1, index) {
              return TranscationItem(transcation: widget.userTranscations[index],deleteTX: widget.deleteTranscations,);
            },
            itemCount: widget.userTranscations.length,
          );
  }
}



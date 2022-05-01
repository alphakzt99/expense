import 'package:flutter/material.dart';
import 'package:expense/widget/TranscationItem.dart';

class NewTranscations extends StatefulWidget {
  bool theme;
  List userTranscations = [];
  final Function add;
  Function deleteTranscations;
  NewTranscations(
      {Key? key,
      required this.userTranscations,
      required this.deleteTranscations,
      required this.add,
      required this.theme})
      : super(key: key);

  @override
  _NewTranscationsState createState() => _NewTranscationsState();
}

class _NewTranscationsState extends State<NewTranscations> {
  
  Widget build(BuildContext context) {
    return widget.userTranscations.isEmpty
        ? LayoutBuilder(
            builder: (context2, constraints) => Column(
              children: [
                Text(
                  'No Transcation Yet',
                  style: TextStyle(
                      fontFamily: "PlayFairDisplay",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: widget.theme
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorDark),
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
        : ListView(children: widget.userTranscations.map((tx) => TranscationItem(
                key: ValueKey(tx.id),
                transcation: tx,
                deleteTX: widget.deleteTranscations,
                theme: widget.theme,
              )).toList()
              );
          
  }
}

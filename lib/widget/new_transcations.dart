import 'package:flutter/material.dart';
import 'package:expense/widget/TranscationItem.dart';

class NewTranscations extends StatefulWidget {
  bool _theme;
  List userTranscations = [];
  final Function add;
  Function deleteTranscations;
  NewTranscations(
      this.userTranscations, this.deleteTranscations, this.add, this._theme);

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
                      color: widget._theme
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
        : ListView.builder(
            itemBuilder: (context1, index) {
              return TranscationItem(
                transcation: widget.userTranscations[index],
                deleteTX: widget.deleteTranscations,
                theme: widget._theme,
              );
            },
            itemCount: widget.userTranscations.length,
          );
  }
}

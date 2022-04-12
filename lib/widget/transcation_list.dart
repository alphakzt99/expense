import 'package:flutter/material.dart';
import 'package:expense/widget/new_transcations.dart';

class TranscationList extends StatefulWidget {
  List _usertranscations = [];
  Function _deleteTranscations;
  TranscationList(this._usertranscations, this._deleteTranscations);

  @override
  State<TranscationList> createState() => _TranscationListState();
}

class _TranscationListState extends State<TranscationList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTranscations(widget._usertranscations,widget._deleteTranscations),
      ],
    );
  }
}

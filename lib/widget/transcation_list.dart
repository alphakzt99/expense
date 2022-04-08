import 'package:flutter/material.dart';
import 'package:expense/widget/new_transcations.dart';

class TranscationList extends StatefulWidget {
  List usertranscations = [];
  TranscationList({Key? key,required this.usertranscations}) : super(key: key);

  @override
  State<TranscationList> createState() => _TranscationListState();
}

class _TranscationListState extends State<TranscationList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTranscations(widget.usertranscations),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:expense/models/transcations.dart';
import 'package:expense/widget/new_transcations.dart';
import 'package:expense/widget/user_transcations.dart';

class TranscationList extends StatefulWidget {
  TranscationList({Key? key}) : super(key: key);

  @override
  State<TranscationList> createState() => _TranscationListState();
}

class _TranscationListState extends State<TranscationList> {
  final List<Transcations> usertranscations = [
    Transcations(
        id: "01", title: "New shoe", amount: 69.99, date: DateTime.now()),
    Transcations(
        id: "02", title: "New phone", amount: 123.99, date: DateTime.now())
  ];
  void _addTranscation(String txtitle, double txamount) {
    final newTx = Transcations(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());
    setState(() {
      usertranscations.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserTranscations(_addTranscation),
        NewTranscations(usertranscations),
      ],
    );
  }
}

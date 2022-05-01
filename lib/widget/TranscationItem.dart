import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense/models/transcations.dart';
import 'dart:math';

class TranscationItem extends StatefulWidget {
  TranscationItem(
      {Key? key,
      required this.transcation,
      required this.deleteTX,
      required this.theme})
      : super(key: key);
  final Transcations transcation;
  final Function deleteTX;
  final bool theme;

  @override
  State<TranscationItem> createState() => _TranscationItemState();
}

class _TranscationItemState extends State<TranscationItem> {
  late Color bgcolor;
  @override
  void initState() {
    const availableColors = [
      Colors.white,
      Colors.limeAccent,
      Colors.cyanAccent
    ];
    bgcolor = availableColors[Random().nextInt(3)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var color1 = Theme.of(context).primaryColor;
    var color2 = Theme.of(context).primaryColorDark;
    var color3 = Theme.of(context).primaryColorLight;
    return Card(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        elevation: 6,
        child: ListTile(
          tileColor: widget.theme ? color1 : color2,
          leading: CircleAvatar(
              backgroundColor: bgcolor,
              radius: 30.0,
              child: FittedBox(
                child: Text(
                  "\$${widget.transcation.amount}",
                  style: TextStyle(color: widget.theme ? color3 : color2),
                ),
              )),
          title: Text(
            widget.transcation.title,
            style:
                TextStyle(fontSize: 25, color: widget.theme ? color2 : color1),
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(widget.transcation.date),
            style: TextStyle(color: widget.theme ? color2 : color1),
          ),
          trailing: MediaQuery.of(context).size.width > 400
              ? TextButton.icon(
                  onPressed: () {
                    widget.deleteTX(widget.transcation.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  label: Text(
                    'Delete',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    widget.deleteTX(widget.transcation.id);
                  },
                  color: Theme.of(context).errorColor,
                ),
        ));
  }
}

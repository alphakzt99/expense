import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense/models/transcations.dart';

class TranscationItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    var color1 = Theme.of(context).primaryColor;
    var color2 = Theme.of(context).primaryColorDark;
    var color3 = Theme.of(context).primaryColorLight;
    return Card(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        elevation: 6,
        child: ListTile(
          tileColor: theme? color1:color2,
          leading: CircleAvatar(
              backgroundColor: theme ? color2 : color1,
              radius: 30.0,
              child: FittedBox(
                child: Text(
                  "\$${transcation.amount}",
                  style: TextStyle(color: theme? color3:color2),
                ),
              )),
          title: Text(
            transcation.title,
            style: TextStyle(fontSize: 25, color: theme ? color2 : color1),
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transcation.date),
            style: TextStyle(color: theme ? color2 : color1),
          ),
          trailing: MediaQuery.of(context).size.width > 400
              ? TextButton.icon(
                  onPressed: () {
                    deleteTX(transcation.id);
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
                    deleteTX(transcation.id);
                  },
                  color: Theme.of(context).errorColor,
                ),
        ));
  }
}

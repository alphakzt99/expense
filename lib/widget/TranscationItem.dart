import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense/models/transcations.dart';
class TranscationItem extends StatelessWidget {
  const TranscationItem({
    Key? key,
    required this.transcation,
    required this.deleteTX
  }) : super(key: key);
  final Transcations transcation;
  final Function deleteTX;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        elevation: 6,
        child: ListTile(
          leading: CircleAvatar(
              radius: 30.0,
              child: FittedBox(
                child: Text(
                    "\$${transcation.amount}"),
              )),
          title: Text(
            transcation.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(DateFormat.yMMMd()
              .format(transcation.date)),
          trailing: MediaQuery.of(context).size.width > 400
              ? TextButton.icon(
                  onPressed: () {
                    deleteTX(
                        transcation.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  label: Text(
                    'Delete',
                    style: TextStyle(
                        color: Theme.of(context).errorColor),
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    deleteTX(
                        transcation.id);
                  },
                  color: Theme.of(context).errorColor,
                ),
        ));
  }
}
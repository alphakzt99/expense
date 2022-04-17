import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscations extends StatefulWidget {
  List userTranscations = [];
  Function add;
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
    return widget.userTranscations.isEmpty
        ? LayoutBuilder(
          builder: (context, constraints) => 
          Column(
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
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey<int>(index),
                onDismissed: (direction) {
                  setState(() {
                    widget.userTranscations.removeAt(index);
                  });
                },
                child: Card(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    elevation: 6,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30.0,
                          child: FittedBox(
                            child: Text(
                                "\$${widget.userTranscations[index].amount}"),
                          )),
                      title: Text(
                        widget.userTranscations[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(widget.userTranscations[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _editTranscations(
                              widget.userTranscations[index].id,
                              widget.userTranscations[index].title,
                              widget.userTranscations[index].amount,
                              widget.userTranscations[index].date);
                        },
                        color: Colors.purple,
                      ),
                    )),
              );
            },
            itemCount: widget.userTranscations.length,
          );
  }
}

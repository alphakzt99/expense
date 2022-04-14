import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscations extends StatefulWidget {
  List userTranscations = [];
  Function deleteTranscations;
  NewTranscations(this.userTranscations, this.deleteTranscations);

  @override
  _NewTranscationsState createState() => _NewTranscationsState();
}

class _NewTranscationsState extends State<NewTranscations> {
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height * 0.7 - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
        child: widget.userTranscations.isEmpty
            ? Column(
                children: [
                  Text(
                    'No Transcation Yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/Waiting.jpg',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                        trailing: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: (){},
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                widget.deleteTranscations(
                                    widget.userTranscations[index].id);
                              },
                              color: Theme.of(context).errorColor,
                            ),
                          ],
                        ),
                      ));
                },
                itemCount: widget.userTranscations.length,
              ),
      ),
    );
  }
}

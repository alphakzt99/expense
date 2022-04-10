import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranscations extends StatefulWidget {
  List userTranscations = [];
  NewTranscations(this.userTranscations);

  @override
  _NewTranscationsState createState() => _NewTranscationsState();
}

class _NewTranscationsState extends State<NewTranscations> {
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    elevation: 6,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                          child: FittedBox(
                            child: Text(
                                "\$${widget.userTranscations[index].amount}"),
                          )),
                      title: Text(widget.userTranscations[index].title,style: Theme.of(context).textTheme.headline6,),
                      subtitle: Text(DateFormat.yMMMd().format(widget.userTranscations[index].date)),
                    ));
              },
              itemCount: widget.userTranscations.length,
            ),
    );
  }
}

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
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2)),
                            child: Text(
                              '\$${widget.userTranscations[index].amount}',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.userTranscations[index].title,
                                //add textTheme with recalled Theme.of(context)
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              //dateformat
                              Text(
                                  DateFormat().format(
                                      widget.userTranscations[index].date),
                                  style: TextStyle(color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                    ));
              },
              itemCount: widget.userTranscations.length,
            ),
    );
  }
}

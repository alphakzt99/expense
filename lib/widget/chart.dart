import 'package:flutter/material.dart';
import 'package:expense/widget/chart-bar.dart';
import 'package:expense/models/transcations.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  bool _theme;
  final List<Transcations> recentTranscations;
  Chart(
    this.recentTranscations,
    this._theme,
  );

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get transcationsRecentValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSpending = 0.0;
      for (var i = 0; i < widget.recentTranscations.length; i++) {
        if (widget.recentTranscations[i].date.day == weekDay.day &&
            widget.recentTranscations[i].date.month == weekDay.month &&
            widget.recentTranscations[i].date.year == weekDay.year) {
          totalSpending += widget.recentTranscations[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSpending
      };
    }).reversed.toList();
  }

  double get totalspending {
    return transcationsRecentValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget._theme ? Theme.of(context).primaryColorLight:Theme.of(context).primaryColor,
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...transcationsRecentValues.map((data) {
              return ChartBar(
                  data['day'].toString(),
                  (data['amount'] as double),
                  (data['amount'] as double) / totalspending,widget._theme);
            }).toList()
          ],
        ),
      ),
    );
  }
}

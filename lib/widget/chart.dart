import 'package:flutter/material.dart';
import 'package:expense/widget/chart-bar.dart';
import 'package:expense/models/transcations.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transcations> recentTranscations;
  Chart(this.recentTranscations);

  List<Map<String, Object>> get transcationsRecentValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSpending = 0.0;
      for (var i = 0; i < recentTranscations.length; i++) {
        if (recentTranscations[i].date.day == weekDay.day &&
            recentTranscations[i].date.month == weekDay.month &&
            recentTranscations[i].date.year == weekDay.year) {
          totalSpending += recentTranscations[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSpending
      };
    });
  }

  double get totalspending {
    return transcationsRecentValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as num);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...transcationsRecentValues.map((data) {
              return ChartBar(data['day'].toString(),(data['amount'] as double), (data['amount'] as double) / totalspending);
            }).toList()
          ],
        ),
      ),
    );
  }
}

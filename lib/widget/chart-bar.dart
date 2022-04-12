import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double totalspending;
  ChartBar(this.label, this.amount, this.totalspending);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('\$${amount.toStringAsFixed(0)}'),
          SizedBox(),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey),
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                totalspending.isNaN ? Container() :FractionallySizedBox(heightFactor: totalspending,
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(10)),
                ),)
              ],
            ),
          ),
          Text(label)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double totalspending;
  ChartBar(this.label, this.amount, this.totalspending);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${amount.toStringAsFixed(0)}')),
          ),
          SizedBox(height: constraints.maxHeight * 0.05,),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.grey),
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10)),
                ),
                totalspending.isNaN
                    ? Container()
                    : FractionallySizedBox(
                        heightFactor: totalspending,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05,),
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}
